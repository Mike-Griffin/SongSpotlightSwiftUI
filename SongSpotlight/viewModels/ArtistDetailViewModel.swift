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
    @Published var songs: [SongPreview]?
    let geniusApi = GeniusApiService()
    let preview : ArtistPreview
    
    init(preview: ArtistPreview) {
        self.preview = preview
        print(preview)
    }
    
    func fetchArtistInfo() {
        let artistRequest = "artists/\(self.preview.id)"
        geniusApi.fetch(request: artistRequest) { (result: Result<ArtistIdResult, Error>) in
            switch(result){
            case .success(let artistResult):
                self.artist = artistResult.response.artist
                //print(self.artist)
            case .failure:
                print("failure")
            }
        }
        
        makeSongRequest(page: 1)
    }
    
    func makeSongRequest(page: Int) {
        let songRequest = "artists/\(self.preview.id)/songs?sort=popularity&per_page=5&page=\(page)"
        geniusApi.fetch(request: songRequest) { (result: Result<SongReferenceResult, Error>) in
            switch(result) {
            case .success(let songResult):
                self.songs = songResult.response.songs
                //print(self.songs)
            case .failure:
                print("failure")
            }
            
        }
    }
}
