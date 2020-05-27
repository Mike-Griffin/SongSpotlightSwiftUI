//
//  AlbumDetailView.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/26/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import SwiftUI

struct AlbumDetailView: View {
    @ObservedObject var viewModel : AlbumDetailViewModel
    
    init(preview: AlbumPreview) {
        self.viewModel = AlbumDetailViewModel(preview: preview)
    }
    
    var body: some View {
        VStack {
            Text(viewModel.preview.name)
            if viewModel.tracks != nil {
                ScrollView {
                    ForEach(viewModel.tracks!, id: \.self) { track in
                        HStack {
                            if track.number != nil {
                                Text(String(track.number!))
                                SongPreviewView(songPreview: track.song)
                            }
                        }
                    }
                }
            }
        }
        .onAppear(perform: viewModel.fetchAlbumInfo)
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(preview: AlbumPreview(name: "", id: 1))
    }
}
