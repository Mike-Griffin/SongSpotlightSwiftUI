//
//  SearchViewModel.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/16/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import Foundation

class SearchViewModel : ObservableObject {
    @Published var searchText = ""

    @Published var searchResults : [SongPreview] = [SongPreview(title: "Monster", artist: ArtistPreview(name: "Kanye", id: 1), image: nil, id: 1), SongPreview(title: "Power", artist: ArtistPreview(name: "Kanye", id: 1), image: nil, id: 2)]
    
    init() {
        print("In VM init", searchText)
        print(searchResults)
    }
}
