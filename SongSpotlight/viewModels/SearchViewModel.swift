//
//  SearchViewModel.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/16/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import Foundation

class SearchViewModel : ObservableObject {
    private var counting = 2
    @Published var searchText = "" {
        didSet {
            counting += 1
            searchResults.append(SongPreview(title: searchText, artist: ArtistPreview(name: "Kanye", id: 1), image: nil, id: counting))
        }
    }

    @Published var searchResults : [SongPreview] = [SongPreview(title: "Monster", artist: ArtistPreview(name: "Kanye", id: 1), image: nil, id: 1), SongPreview(title: "Power", artist: ArtistPreview(name: "Kanye", id: 1), image: nil, id: 2)]
    
    init() {
        print("In VM init", searchText)
    }
}
