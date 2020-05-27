//
//  Song.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/16/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import Foundation

struct Song : Codable, Equatable {
    static func == (lhs: Song, rhs: Song) -> Bool {
        return lhs.title == rhs.title && lhs.url == rhs.url
    }
    
    let primaryArtist : ArtistPreview
    let url : String
    let title : String
    let writers : [ArtistPreview]?
    let producers: [ArtistPreview]?
    let featured: [ArtistPreview]?
    let album : AlbumPreview?
    let releaseDate: String?
    let recordingLocation: String?
    private enum CodingKeys: String, CodingKey {
        case primaryArtist = "primary_artist", url, album, releaseDate = "release_date", recordingLocation = "recording_location", title = "title", writers = "writer_artists", producers = "producer_artists", featured = "featured_artists"
    }
}

struct SongResponse : Codable {
    let song : Song
}

struct SongIdResult: Codable {
    let response : SongResponse
}
