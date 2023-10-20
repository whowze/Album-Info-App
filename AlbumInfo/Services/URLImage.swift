//
//  URLImage.swift
//  AlbumInfo
//
//  Created by William Howze on 10/20/23.
//

import SwiftUI

struct URLImage: View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
        
        if let data = self.imageLoader.downloadedData, let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage).resizable()
                .resizable()
                .border(Color.green, width: 2)
                .cornerRadius(10)
        } else {
            return Image("placeholder")
                .resizable()
                .border(Color.green, width: 10)
                .cornerRadius(10)
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/21/50/ee/2150ee84-62c3-4190-7dfa-da30abd98ac8/23UM1IM09862.rgb.jpg/100x100bb.jpg")
            .frame(width: 100, height: 100)
    }
}
