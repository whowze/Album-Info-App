//
//  AlbumDetailsView.swift
//  AlbumInfo
//
//  Created by William Howze on 9/24/23.
//

import SwiftUI

struct AlbumDetailsView: View {
    let result: Result
    
    
    var body: some View {
        VStack {
            Image(systemName: "music.mic.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding(.top, 50)
                .padding(.bottom, 100)

            VStack(spacing: 15) {
                Text(result.artistName)
                    .font(.title2)
                    .bold()
                
                Text(result.songTitle)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                
                Text("Release date: \(result.formattedReleaseDate)")
                    .font(.subheadline)
                
                Text("Rated: \(result.contentRating)")
                    .font(.subheadline)
            }
            
            Spacer()
        }
    }
    
    struct AlbumDetailsView_Previews: PreviewProvider {
        static var previews: some View {
            AlbumDetailsView(result: Result(artistName: "name", songTitle: "title", albumArtwork: "artWork", songUrl: "song", contentAdvisoryRating: "rating", releaseDate: "date"))
        }
    }
}
