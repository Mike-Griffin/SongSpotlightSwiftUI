//
//  Album.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/26/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import Foundation

struct Album : Codable {
    
}

struct Track : Codable, Equatable, Hashable {
    let number : Int?
    let song : SongPreview
}

struct AlbumTrackResponse: Codable {
    let tracks: [Track]
}

struct AlbumTrackResult: Codable {
    let response: AlbumTrackResponse
}
