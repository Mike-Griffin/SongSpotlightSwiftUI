//
//  AlbumDetailViewModel.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/26/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import Foundation

class AlbumDetailViewModel : ObservableObject {
    //@Published var album: Album
    @Published var tracks : [Track]?
    let geniusApi = GeniusApiService()
    let preview : AlbumPreview
    
    init(preview: AlbumPreview) {
        self.preview = preview
    }
    
    func fetchAlbumInfo() {
        fetchAlbumTracks()
    }
    
    func fetchAlbumTracks() {
        let tracksRequest = "albums/\(preview.id)/tracks"
        geniusApi.fetch(request: tracksRequest) { (result: Result<AlbumTrackResult, Error>) in
            switch(result) {
            case .success(let trackResult):
                var resultTracks = [Track]()
                for track in trackResult.response.tracks {
                    resultTracks.append(track)
                }
                self.tracks = resultTracks
            case .failure:
                print("failure")
            }
        }
    }
}
