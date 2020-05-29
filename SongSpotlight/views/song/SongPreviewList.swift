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
    let searchViewModel : SearchViewModel?
    var body: some View {
        
        ForEach(songPreviews) { song in
            NavigationLink(destination: SongDetailView(preview: song)) {
                if self.searchViewModel != nil {
                    SongPreviewView(songPreview: song)
                        .onAppear{
                            self.searchViewModel!.loadMoreSongs(currentSong: song)
                    }
                }
                else {
                    SongPreviewView(songPreview: song)
                }
            }
        .buttonStyle(PlainButtonStyle())
        }
    }
}

struct SongPreviewList_Previews: PreviewProvider {
    static var previews: some View {
        SongPreviewList(songPreviews: [SongPreview(title: "", artist: ArtistPreview(name: "", id: 1), image: nil, id: 1)], searchViewModel: nil)
    }
}
