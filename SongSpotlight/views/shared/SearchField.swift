//
//  SearchField.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/16/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import SwiftUI

struct SearchField: View {
    @Binding var searchText: String
    var placeholder: LocalizedStringKey = "Search..."

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .imageScale(.medium)
                .foregroundColor(.gray)
            TextField(placeholder, text: $searchText)
                .font(.headline)
                .disableAutocorrection(true)
            if !searchText.isEmpty {
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark")
                        .font(.headline)
                        .foregroundColor(.black)
                        .imageScale(.small)
                }.buttonStyle(BorderlessButtonStyle())
            }
        }
        .padding(8)
        //.background(Color.orange)
        .background(Color.white)
        .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
        .padding(2)
        .listRowBackground(Color.ssBackground)
    }
}

struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        SearchField(searchText: .constant("Editing"),
        placeholder: "test")
    }
}
