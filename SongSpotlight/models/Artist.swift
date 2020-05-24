//
//  Artist.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/18/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import Foundation

struct Artist : Codable {
    let name: String
    let id: Int
    // TODO reconsider if I really need this
    let url: String
    let alternateNames: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, url, alternateNames = "alternate_names"
    }
}

struct ArtistResponse : Codable {
    let artist : Artist
}

struct ArtistIdResult: Codable {
    let response : ArtistResponse
}
