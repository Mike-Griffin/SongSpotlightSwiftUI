//
//  SongOverview.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/17/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import SwiftUI

struct SongOverviewView: View {
    let song: Song
    
    var body: some View {
        VStack {
            Text(song.title)
            Text(song.primaryArtist.name)
            if song.album != nil {
                NavigationLink(destination: AlbumDetailView(preview: song.album!)) {
                    Text("Album: \(song.album!.name)")
                }
            }
            if song.featured != nil && song.featured!.count != 0{
                VStack {
                    Spacer()
                    Text("Featured Artists")
                        .font(.headline)
                    ArtistListView(artists: song.featured!)
                }
            }
            if song.writers != nil {
                Spacer()
                VStack(alignment: .leading) {
                    Section(header: SectionHeaderView(text: "Writers", icon: "pencil.circle")) {
                        VStack {
                            ArtistListView(artists: song.writers!)
                        }
                        .padding(.horizontal, 100)
                        .background(Color.ssSecondaryBackground)
                        
                    }
                }

            }
            if song.producers != nil {
                VStack {
                    Spacer()
                    Text("Producers")
                        .font(.headline)
                    ArtistListView(artists: song.producers!)
                }
            }
        }
    }
}

struct SongOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        SongOverviewView(song: Song(primaryArtist: ArtistPreview(name: "", id: 1), url: "", title: "", writers: nil, producers: nil, featured: nil, album: nil, releaseDate: nil, recordingLocation: nil))
    }
}
