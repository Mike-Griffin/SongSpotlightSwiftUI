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
            geniusApi.fetchSearch(query: noSpaces, page: 1) { results in
                switch(results){
                case .success(let hits):
                    var querySongs = [SongPreview]()
                    for hit in hits {
                        querySongs.append(hit.result)
                    }
                    self.searchResults = querySongs
                case .failure:
                    debugPrint("failed")
                }
            }
        }
    }
    


