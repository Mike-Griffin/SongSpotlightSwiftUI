//
//  LoadingView.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/28/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    @Binding var isLoading: Bool

    var body: some View {
        ActivityIndicator(isAnimating: $isLoading, style: .large)
    }
}

struct LoadingView_Previews: PreviewProvider {
    @Binding var isLoading : Bool
    static var previews: some View {
        LoadingView(isLoading: .constant(true))
    }
}
