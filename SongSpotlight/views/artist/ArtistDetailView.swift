//
//  ArtistDetailView.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/18/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import SwiftUI

struct ArtistDetailView: View {
    let viewModel : ArtistDetailViewModel
    
    init(preview: ArtistPreview) {
        self.viewModel = ArtistDetailViewModel(preview: preview)
    }
    
    var body: some View {
        Text(viewModel.preview.name)
    }
}

struct ArtistDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistDetailView(preview: ArtistPreview(name: "Jack", id: 1))
    }
}
