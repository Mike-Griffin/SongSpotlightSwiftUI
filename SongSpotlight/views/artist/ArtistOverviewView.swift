//
//  ArtistOverviewView.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/24/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import SwiftUI

struct ArtistOverviewView: View {
    let artist: Artist

    var body: some View {
        VStack(alignment: .leading) {
            //Text(artist.name)
              //  .font(.largeTitle)
            if artist.alternateNames != nil && artist.alternateNames!.count != 0 {
                Section(header: SectionHeaderView(text: "Nicknames", icon: nil)) {
                    ForEach(0..<self.artist.alternateNames!.count) { i in

                        Text(self.artist.alternateNames![i])
                    }
                    //.lineSpacing(20)
                }
                //Spacer()
            }
        }
    }
}

struct ArtistOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistOverviewView(artist: Artist(name: "", id: 1, url: "", alternateNames: nil))
    }
}
