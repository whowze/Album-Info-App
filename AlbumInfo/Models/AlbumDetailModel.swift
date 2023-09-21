//
//  AlbumDetailModel.swift
//  MusicApp
//
//  Created by Howze, Bill on 9/18/23.
//

import Foundation

//struct SongData: Codable { // feed
//	let results: Results
//	let genre: Genre
//}

struct Results: Codable {
	let artistName: String
	let songTitle: String // currently name
	let albumArtwork: String // currently artworkUrl100
	
	enum CodingKeys: String, CodingKey {
		case artistName
		case songTitle = "name"
		case albumArtwork = "artworkUrl100"
	}
}

//struct Genre: Codable {
//	let songURL: String // currently url
//
//	enum CodingKeys: String, CodingKey {
//		case songURL = "url"
//	}
//}
