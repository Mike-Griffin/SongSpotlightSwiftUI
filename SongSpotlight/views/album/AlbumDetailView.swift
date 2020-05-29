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
            if viewModel.tracks != nil {
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(viewModel.tracks!, id: \.self) { track in
                            HStack {
                                if track.number != nil {
                                    NavigationLink(destination: SongDetailView(preview: track.song)) {
                                        Text(String(track.number!))
                                        SongPreviewView(songPreview: track.song)
                                    }
                                   .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                    }
                }
            }
 
        }
        .navigationBarTitle("\(viewModel.preview.name)", displayMode: .inline)
        .onAppear(perform: viewModel.fetchAlbumInfo)

    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(preview: AlbumPreview(name: "", id: 1))
    }
}
