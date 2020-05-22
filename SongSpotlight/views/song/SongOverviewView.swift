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
            if song.album != nil {
                Text("Album: \(song.album!.name)")
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
                VStack {
                    Spacer()
                    Section(header: Text("Writers")) {
                        ArtistListView(artists: song.writers!)
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
        SongOverviewView(song: Song(url: "", title: "", writers: nil, producers: nil, featured: nil, album: nil, releaseDate: nil, recordingLocation: nil))
    }
}
