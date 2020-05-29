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
    
    init(artists: [ArtistPreview]){
        self.artists = artists
        UITableView.appearance().separatorColor = UIColor.black
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().backgroundColor = UIColor(named: "SSSecondaryBackgroundColor")
        
    }
    
    var body: some View {
        List {
            ForEach(artists, id: \.self) { artist in
                NavigationLink(destination: ArtistDetailView(preview: artist)) {
                    Text(artist.name)
                }
                .padding(.vertical, 5)
                .lineSpacing(10)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .listRowBackground(Color.ssSecondaryBackground)
            .buttonStyle(PlainButtonStyle())
        }
        .id(UUID().uuidString)
        .background(Color.ssSecondaryBackground)
        //.listStyle(GroupedListStyle())
    }
}

struct ArtistListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistListView(artists: [])
    }
}
