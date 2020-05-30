//
//  SearchViewModel.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/16/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import Foundation


class SearchViewModel : ObservableObject, LoadSongsViewModelProtocol {

    
                
        @Published var searchText = "" {
            didSet {
                print("next page")
                nextPageToLoad = 1
                searchResults = []
                performQuery(searchText)
            }
        }

        @Published var searchResults = [SongPreview]()
        
        private var geniusApi = GeniusApiService()
        private var nextPageToLoad = 1
        private var query : String?
        private var request : String?
        private var isLoading = false

        
        private func performQuery(_ q: String) {
            let noSpaces = q.replacingOccurrences(of: " ", with: "%20")
            query = noSpaces
            generateRequest()
            fetchSongs()
        }
        
        func loadMore(currentSong: SongPreview? = nil) {
            guard let currentSong = currentSong else {
                return
            }
            
            guard let lastSong = searchResults.last else {
                return
            }
            
            if lastSong.id == currentSong.id {
                fetchSongs()
            }
        }
        
        func fetchSongs() {
            guard !isLoading else { return }
            isLoading = true
            guard let request = request else { return }
            geniusApi.fetch(request: request) { (results : Result<SearchResult, Error> ) in
                switch(results){
                case .success(let result):
                    var querySongs = [SongPreview]()
                    let hits = result.response.hits
                    for hit in hits {
                        querySongs.append(hit.result)
                    }
                    self.searchResults.append(contentsOf: querySongs)
                    self.nextPageToLoad += 1
                    self.generateRequest()
                    self.isLoading = false
                case .failure:
                    debugPrint("failed")
                }
            }
        }
        
        func generateRequest() {
            //print("generate request \(page)" )
            guard let query = query else { return }
            request = "search?q=\(query)&per_page=16&page=\(nextPageToLoad)"
        }
    }
    


