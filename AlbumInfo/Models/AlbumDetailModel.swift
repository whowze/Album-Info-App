//
//  AlbumDetailModel.swift
//  MusicApp
//
//  Created by Howze, Bill on 9/18/23.
//

import Foundation

struct Welcome: Codable, Hashable {
    let feed: Feed
}

// MARK: - Feed

struct Feed: Codable, Hashable {
    let results: [Result]
}

// MARK: - Result

struct Result: Codable, Hashable {
    let artistName: String
    let songTitle: String
    let albumArtwork: String
    let songUrl: String
    let kind: String

    enum CodingKeys: String, CodingKey {
        case artistName, kind
        case songTitle = "name"
        case albumArtwork = "artworkUrl100"
        case songUrl = "url"
    }
}
