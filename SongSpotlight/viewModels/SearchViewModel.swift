//
//  SearchViewModel.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/16/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import Foundation


    class SearchViewModel : ObservableObject {
                
        @Published var searchText = "" {
            didSet {
                performQuery(searchText)
            }
        }

        @Published var searchResults = [SongPreview]()
        
        init() {
            print("In VM init", searchText)
        }
        private var geniusApi = GeniusApiService()

        
        private func performQuery(_ q: String) {
            let noSpaces = q.replacingOccurrences(of: " ", with: "%20")
            let request = generateRequest(query: noSpaces, page: 1)
            geniusApi.fetch(request: request) { (results : Result<SearchResult, Error> ) in
                switch(results){
                case .success(let result):
                    var querySongs = [SongPreview]()
                    let hits = result.response.hits
                    for hit in hits {
                        querySongs.append(hit.result)
                    }
                    self.searchResults = querySongs
                case .failure:
                    debugPrint("failed")
                }
            }
        }
        
        func generateRequest(query: String, page: Int) -> String {
            return "search?q=\(query)&per_page=10&page=\(page)"
        }
    }
    


