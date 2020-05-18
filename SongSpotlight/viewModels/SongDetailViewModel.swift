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
        geniusApi.fetchSong(id: preview.id){ result in
            switch(result){
            case .success(let song):
                print("great success")
                self.song = song
            case .failure:
                print("failed")
            }
        }
    }
    

    
}
