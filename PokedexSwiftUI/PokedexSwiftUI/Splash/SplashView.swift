//
//  SplashView.swift
//  PokedexSwiftUI
//
//  Created by David Robert on 16/08/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack{
            Color("BgBlue")
            Image("pokedexLogo")
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
