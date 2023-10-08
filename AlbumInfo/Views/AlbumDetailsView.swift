//
//  AlbumDetailsView.swift
//  AlbumInfo
//
//  Created by William Howze on 9/24/23.
//

import SwiftUI

struct AlbumDetailsView: View {
    let result: Result
    @State private var imageData: Data? = nil
    
    var body: some View {
        VStack {

            Image(systemName: "music.mic.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding(25)
            
            VStack(spacing: 15) {
                Text(result.songTitle)
                    //.font(.system(size: 24))
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                
                Text(result.artistName)
                    .font(.title2)
                
                Text(result.kind)
            }
            
            Spacer()
        }
    }
    
    
    
    struct AlbumDetailsView_Previews: PreviewProvider {
        static var previews: some View {
            AlbumDetailsView(result: Result(artistName: "name", songTitle: "title", albumArtwork: "artWork", songUrl: "song", kind: "kind"))
        }
    }
}
