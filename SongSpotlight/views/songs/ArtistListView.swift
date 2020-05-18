//
//  ArtistListView.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/17/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import SwiftUI

struct ArtistListView: View {
    let artists : [ArtistPreview]
    
    var body: some View {
        List {
            ForEach(artists) { artist in
                Text(artist.name)
            }
        }
    }
}

struct ArtistListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistListView(artists: [])
    }
}
