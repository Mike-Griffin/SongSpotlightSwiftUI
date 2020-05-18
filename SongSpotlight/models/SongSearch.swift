//
//  SongSearch.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/16/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import Foundation

// these are all used as part of the genius API search
public struct SongHit: Codable {
    let result: SongPreview
}

struct SearchResponse: Codable {
    let hits: [SongHit]
}

struct SearchResult: Codable {
    let response: SearchResponse
}
