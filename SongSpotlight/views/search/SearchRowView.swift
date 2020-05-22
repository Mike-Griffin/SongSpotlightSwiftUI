//
//  SearchRowView.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/17/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import SwiftUI

struct SearchRowView: View {
    let songPreview : SongPreview
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(songPreview.title)")
                .font(.headline)
            Text("\(songPreview.artist.name)")
                .font(.footnote)
        }
    }
}

struct SearchRowView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRowView(songPreview: SongPreview(title: "Test", artist: ArtistPreview(name: "Test", id: 1), image: nil, id: 1))
    }
}
