//
//  ArtistDetailViewModel.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/18/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import Foundation

class ArtistDetailViewModel : ObservableObject {
    @Published var artist : Artist?
    let geniusApi = GeniusApiService()
    let preview : ArtistPreview
    
    init(preview: ArtistPreview) {
        self.preview = preview
        print(preview)
    }
}
