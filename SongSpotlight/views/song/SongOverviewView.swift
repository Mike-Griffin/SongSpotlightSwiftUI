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
                .font(.title)
            Text(song.primaryArtist.name)
            if song.album != nil {
                NavigationLink(destination: AlbumDetailView(preview: song.album!)) {
                    Text("Album: \(song.album!.name)")
                }
            .buttonStyle(PlainButtonStyle())
            }
            
            if song.featured != nil && song.featured!.count != 0{
                ArtistListSectionView(sectionHeaderText: "Featured Artists", sectionHeaderIcon: nil, artists: song.featured!)
            }
            
            if song.writers != nil && song.writers!.count != 0 {
                ArtistListSectionView(sectionHeaderText: "Writers", sectionHeaderIcon: "pencil.circle", artists: song.writers!)
            }
            
            if song.producers != nil {
                ArtistListSectionView(sectionHeaderText: "Producers", sectionHeaderIcon: "keyboard", artists: song.producers!)
            }
        }
    }
}

struct SongOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        SongOverviewView(song: Song(primaryArtist: ArtistPreview(name: "", id: 1), url: "", title: "", writers: nil, producers: nil, featured: nil, album: nil, releaseDate: nil, recordingLocation: nil))
    }
}
