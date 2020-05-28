//
//  ArtistListSectionView.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/27/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import SwiftUI

struct ArtistListSectionView: View {
    let sectionHeaderText : String
    let sectionHeaderIcon : String?
    let artists : [ArtistPreview]
    
    var body: some View {
        VStack(alignment: .leading) {
            Section(header: SectionHeaderView(text: sectionHeaderText, icon: sectionHeaderIcon)) {
                
                VStack(alignment: .leading){
                    ArtistListView(artists: artists)
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 16)
                .background(Color.ssSecondaryBackground)
                .cornerRadius(20)
                
            }
        }
        .padding(.horizontal, 20)
    }
}

struct ArtistListSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistListSectionView(sectionHeaderText: "Something", sectionHeaderIcon: nil, artists: [ArtistPreview(name: "Artist 1", id: 1), ArtistPreview(name: "Anotha One", id: 2)])
    }
}
