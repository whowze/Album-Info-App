//
//  ContentView.swift
//  AlbumInfo
//  Added More Info - Delete this later
//  Created by Howze, Bill on 9/19/23.
//

import SwiftUI

struct AlbumInfoView: View {
    @StateObject var albumData = AlbumData()
    
    var body: some View {
        NavigationView {
            List(albumData.feed, id: \.self) { result in
                NavigationLink(destination: AlbumDetailsView(result: result)) {
                    VStack(alignment: .leading, spacing: 10) {
                       
                            Text(result.artistName)

                            Text(result.songTitle)
                            
                            
                        
                    }
                    
                    .padding()
                }
            }

            .navigationTitle("Top Songs")
            .navigationBarTitleDisplayMode(.inline)
            }
            .onAppear {
                albumData.fetch()
            }
        }
    }


struct AlbumInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumInfoView()
    }
}
