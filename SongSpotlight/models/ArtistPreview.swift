//
//  ArtistPreview.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/16/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import Foundation

struct ArtistPreview: Codable, Equatable, Identifiable, Hashable {
    let name: String
    let id: Int
}
