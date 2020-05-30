//
//  SectionHeaderView.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/26/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import SwiftUI

struct SectionHeaderView: View {
    var text : String
    var icon: String?
    
    var body: some View {
        HStack(spacing: 6) {
            if icon != nil{
                Image(systemName: icon!)
                    .imageScale(.medium)
                    .rotationEffect(.degrees(-3))
                    .foregroundColor(Color.ssHeaderText)

            }
            Text(text)
                .font(.system(.subheadline, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(Color.ssHeaderText)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 14)
        .background(Color.ssHeaderBackground)
        .mask(RoundedRectangle(cornerRadius: 14, style: .continuous))
        .padding(.leading, 8)
        .padding(.bottom, -8)
    }
}

