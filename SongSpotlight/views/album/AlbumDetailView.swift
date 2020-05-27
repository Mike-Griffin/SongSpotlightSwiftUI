//
//  AlbumDetailView.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/26/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import SwiftUI

struct AlbumDetailView: View {
    init(album: Album) {
        //self.viewModel = ArtistDetailViewModel(preview: preview)
    }
    
    var body: some View {
        Text("Album!")
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(album: Album(name: ""))
    }
}
