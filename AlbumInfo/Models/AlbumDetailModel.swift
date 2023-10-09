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
    let contentAdvisoryRating: String?
    let releaseDate: String
    
    var formattedReleaseDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: releaseDate) {
            dateFormatter.dateFormat = "MM-dd-yyyy"
            return dateFormatter.string(from: date)
        } else {
            return "Invalid date"
        }
    }
    
    var contentRating: String {
        if let rating = contentAdvisoryRating {
            return rating
        } else {
            return "Rating not found"
        }
    }

    enum CodingKeys: String, CodingKey {
        case artistName, contentAdvisoryRating, releaseDate
        case songTitle = "name"
        case albumArtwork = "artworkUrl100"
        case songUrl = "url"
    }
    
}



