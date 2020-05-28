//
//  SongDetailView.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/16/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import SwiftUI

struct SongDetailView: View {
    @ObservedObject var viewModel: SongDetailViewModel
    
    var song : Song {
        if viewModel.song != nil {
            return viewModel.song!
        }
        else {
            return Song(primaryArtist: ArtistPreview(name: "", id: 1), url: "", title: "empty", writers: nil, producers: nil, featured: nil, album: nil, releaseDate: nil, recordingLocation: nil)
        }
    }

    init(preview: SongPreview) {
        self.viewModel = SongDetailViewModel(preview: preview)
    }
    
    var body: some View {
            VStack {
                if viewModel.song != nil {
                    SongOverviewView(song: viewModel.song!)
                }
                else {
                    Text(viewModel.preview.title)
                    
                }
                Spacer()
            }
        .navigationBarTitle("View Song")
            .background(Color.ssBackground.edgesIgnoringSafeArea(.all))
        .onAppear(perform: self.viewModel.fetchSong)
    }
}

struct SongDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SongDetailView(preview: SongPreview(title: "Test", artist: ArtistPreview(name: "Tester", id: 1), image: nil, id: 1))
    }
}
