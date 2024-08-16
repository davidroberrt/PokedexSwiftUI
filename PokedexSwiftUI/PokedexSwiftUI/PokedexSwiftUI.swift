//
//  PokedexSwiftUIApp.swift
//  PokedexSwiftUI
//
//  Created by David Robert on 13/08/24.
//

import SwiftUI

@main
struct PokedexSwiftUI: App {
    var body: some Scene {
        WindowGroup {
            OnboardingView(viewModel: OnboardingViewModel())
        }
    }
}
