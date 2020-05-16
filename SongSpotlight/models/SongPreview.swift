//
//  SongPreview.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/16/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import Foundation

struct SongPreview: Codable, Equatable, Identifiable {
    static func == (lhs: SongPreview, rhs: SongPreview) -> Bool {
        return lhs.id == rhs.id
    }
    
    let title: String
    let artist: ArtistPreview
    // might want this to be a URL instead of String
    let image: String?
    let id: Int
    
    private enum CodingKeys : String, CodingKey {
        case id, title = "title_with_featured", artist = "primary_artist", image = "header_image_thumbnail_url"
    }
}
