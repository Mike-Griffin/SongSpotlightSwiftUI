//
//  SearchView.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/16/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    // replace this with a ViewModel
    
    @ObservedObject var viewModel = SearchViewModel()
    
    // TODO I think I will want a Tab Bar at some point where this should go
//    init() {
//        UINavigationBar.appearance().backgroundColor = UIColor(named: "SSSecondaryBackground")
//        UINavigationBar.bar
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "SSText")]
//    }
    
    var currentSongs: [SongPreview] {
        get {
            if !viewModel.searchText.isEmpty {
                return viewModel.searchResults
            } else {
                return []
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: SearchField(searchText: $viewModel.searchText, placeholder: "Search song")) {
                    SongPreviewList(songPreviews: currentSongs)
                }
            }
            .navigationBarTitle("Search")

        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
