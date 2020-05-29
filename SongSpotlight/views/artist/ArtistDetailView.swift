//
//  ArtistDetailView.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/18/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import SwiftUI

struct ArtistDetailView: View {
    @ObservedObject var viewModel : ArtistDetailViewModel
    
    init(preview: ArtistPreview) {
        self.viewModel = ArtistDetailViewModel(preview: preview)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.preview.name)
                .font(.largeTitle)
            if viewModel.artist != nil {
                ArtistOverviewView(artist: viewModel.artist!)
                if(viewModel.songs != nil) {
                    Section(header: SectionHeaderView(text: "Popular Songs", icon: nil)) {
                    SongPreviewList(songPreviews: viewModel.songs!, searchViewModel: nil)
                    }
                }
            }
            else {
                VStack {
                    LoadingView(isLoading: .constant(true))
                }
            }
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .navigationBarTitle("View Artist", displayMode: .inline)
        .onAppear(perform: viewModel.fetchArtistInfo)
    }
}

struct ArtistDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistDetailView(preview: ArtistPreview(name: "Harry", id: 22457))
    }
}
