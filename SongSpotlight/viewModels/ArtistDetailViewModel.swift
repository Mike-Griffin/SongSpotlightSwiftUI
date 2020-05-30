//
//  ArtistDetailViewModel.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/18/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import Foundation

class ArtistDetailViewModel : ObservableObject, LoadSongsViewModelProtocol {

    
    @Published var artist : Artist?
    @Published var songs = [SongPreview]()
    let geniusApi = GeniusApiService()
    let preview : ArtistPreview
    var nextPage = 1
    var isLoading = false
    
    init(preview: ArtistPreview) {
        self.preview = preview
        //print(preview)
    }
    
    func fetchArtistInfo() {
        print("fetch artist info")
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
        makeSongRequest()
    }
    
    func makeSongRequest() {
        guard !isLoading else { return }
        isLoading = true
        print("make song request")
        let songRequest = "artists/\(self.preview.id)/songs?sort=popularity&per_page=10&page=\(nextPage)"
        geniusApi.fetch(request: songRequest) { (result: Result<SongReferenceResult, Error>) in
            switch(result) {
            case .success(let songResult):
                self.songs.append(contentsOf: songResult.response.songs)
                print(self.songs)
                self.nextPage += 1
                self.isLoading = false
                //print(self.songs)
            case .failure:
                print("failure")
            }
            
        }
    }
    
    func loadMore(currentSong: SongPreview?) {
        guard let currentSong = currentSong else {
            return
        }
        
        guard let last = songs.last else {
            return
        }
        
        if currentSong.id == last.id {
            makeSongRequest()
        }
        
    }
}
