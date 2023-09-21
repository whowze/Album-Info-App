//
//  ContentView.swift
//  AlbumInfo
//  Added More Info - Delete this later
//  Created by Howze, Bill on 9/19/23.
//


import SwiftUI

struct AlbumInfo: Hashable, Codable {
    let artistName: String
    let songTitle: String // currently name
    let albumArtwork: String // currently artworkUrl100
    
    enum CodingKeys: String, CodingKey {
        case artistName
        case songTitle = "name"
        case albumArtwork = "artworkUrl100"
    }
}

class ViewModel: ObservableObject {
    
    @Published var albums: [AlbumInfo] = []
    
    func fetch() {
        // get the data
        guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/songs.json") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            // convert this data to JSON
            
            do {
                let albums = try JSONDecoder().decode([AlbumInfo].self, from: data)
                DispatchQueue.main.async {
                    self?.albums = albums
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}


	
struct AlbumInfoView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.albums, id: \.self) { album in
                    Text(album.artistName)
                }
            }
            .navigationTitle("Song List")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}







struct AlbumInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumInfoView()
    }
}
