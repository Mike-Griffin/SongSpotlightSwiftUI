//
//  SongDetailViewModel.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/16/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import Foundation

class SongDetailViewModel : ObservableObject {
    @Published var song : Song?
    let geniusApi = GeniusApiService()
    let preview : SongPreview
    
    init(preview: SongPreview) {
        self.preview = preview
        print(preview)
    }
    
    func fetchSong() {
        let request = "songs/\(preview.id)"
        geniusApi.fetch(request: request){ (result : Result<SongIdResult, Error> ) in
            switch(result){
            case .success(let songResult):
                self.song = songResult.response.song
            case .failure:
                print("failed")
            }
        }
    }
    

    
}
