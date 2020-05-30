//
//  SongPreviewList.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/24/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import SwiftUI

struct SongPreviewList: View {
    let songPreviews: [SongPreview]
    let viewModel : LoadSongsViewModelProtocol
    var body: some View {
        List {
        ForEach(songPreviews) { song in
            NavigationLink(destination: SongDetailView(preview: song)) {
                    SongPreviewView(songPreview: song)
                        .onAppear {
                            self.viewModel.loadMore(currentSong: song)
                    }

            }
        .buttonStyle(PlainButtonStyle())
        }
        .listRowBackground(Color.ssBackground)
        }
    }
}

struct SongPreviewList_Previews: PreviewProvider {
    static var previews: some View {
        SongPreviewList(songPreviews: [SongPreview(title: "", artist: ArtistPreview(name: "", id: 1), image: nil, id: 1)], viewModel: SearchViewModel())
    }
}
