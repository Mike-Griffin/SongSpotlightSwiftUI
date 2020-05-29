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
            Text(self.song.title)
                .font(.title)
            Text(self.song.primaryArtist.name)
            if self.song.album != nil {
                NavigationLink(destination: AlbumDetailView(preview: self.song.album!)) {
                    Text("Album: \(self.song.album!.name)")
                }
            .buttonStyle(PlainButtonStyle())
            }
            
                if self.song.featured != nil && self.song.featured!.count != 0{
                    ArtistListSectionView(sectionHeaderText: "Featured Artists", sectionHeaderIcon: nil, artists: self.song.featured!)
                }
                
                if self.song.writers != nil && self.song.writers!.count != 0 {
                    ArtistListSectionView(sectionHeaderText: "Writers", sectionHeaderIcon: "pencil.circle", artists: self.song.writers!)
                }
                
                if self.song.producers != nil && self.song.producers!.count != 0 {
                    ArtistListSectionView(sectionHeaderText: "Producers", sectionHeaderIcon: "keyboard", artists: self.song.producers!)
                }
                
            }

    }
}

struct SongOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        SongOverviewView(song: Song(primaryArtist: ArtistPreview(name: "", id: 1), url: "", title: "", writers: nil, producers: nil, featured: nil, album: nil, releaseDate: nil, recordingLocation: nil))
    }
}
