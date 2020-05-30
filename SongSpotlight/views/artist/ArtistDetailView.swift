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
        GeometryReader { geometry in
            ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text(self.viewModel.preview.name)
                    .font(.largeTitle)
                if self.viewModel.artist != nil {
                    ArtistOverviewView(artist: self.viewModel.artist!)
                        //.frame(width: geometry.size.width, height: geometry.size.height / 3)
                        //.background(Color.ssSecondaryBackground)
                    if(self.viewModel.songs.count != 0) {
                        Section(header: SectionHeaderView(text: "Popular Songs", icon: nil)) {
                            SongPreviewList(songPreviews: self.viewModel.songs, viewModel: self.viewModel)
                            .frame(width: geometry.size.width - 32, height: geometry.size.height / 3)

                        }
                        //.background(Color.ssSecondaryBackground)
                    }
                    Spacer()
                }
                else {
                    VStack {
                        LoadingView(isLoading: .constant(true))
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
               // Spacer()
            }
            .background(Color.ssBackground)
            }
            //.frame(maxWidth: .infinity, maxHeight: .infinity)

        }
        .navigationBarTitle("View Artist", displayMode: .inline)
        .onAppear(perform: viewModel.fetchArtistInfo)
    }
}

struct ArtistDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistDetailView(preview: ArtistPreview(name: "Harry", id: 22457))
    }
}
