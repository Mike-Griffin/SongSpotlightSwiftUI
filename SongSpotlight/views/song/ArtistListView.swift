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
            ForEach(artists, id: \.self) { artist in
                NavigationLink(destination: ArtistDetailView(preview: artist)) {
                    Text(artist.name)
                }
                .padding(.vertical, 5)
                .lineSpacing(10)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

            .buttonStyle(PlainButtonStyle())
    }
}

struct ArtistListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistListView(artists: [])
    }
}
