//
//  SongPreviewView.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/24/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import SwiftUI

struct SongPreviewView: View {
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

struct SongPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        SongPreviewView(songPreview: SongPreview(title: "Test", artist: ArtistPreview(name: "Test", id: 1), image: nil, id: 1))
    }
}
