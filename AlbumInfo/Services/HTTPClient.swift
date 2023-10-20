//
//  HTTPClient.swift
//  AlbumInfo
//
//  Created by William Howze on 9/24/23.
//

import Foundation

class AlbumData: ObservableObject {
    @Published var feed: [Result] = []

    func fetch() {
        // create the URL
        guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/music/most-played/40/songs.json") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            // convert this data to JSON
            
            do {
                let decodedData = try JSONDecoder().decode(Welcome.self, from: data)
                DispatchQueue.main.async {
                    self?.feed = decodedData.feed.results
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
