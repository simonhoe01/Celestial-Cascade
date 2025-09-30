//
//  CelestialCascadeApp.swift
//  Celestial Cascade
//
//  Created by Expert iOS Developer
//  Copyright © 2025 Celestial Cascade. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

@main
struct CelestialCascadeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    // TCA Store
    let store: StoreOf<AppFeature>

    init() {
        // Initialize TCA store with initial state and environment
        self.store = Store(
            initialState: AppFeature.State(),
            reducer: {
                AppFeature()
            }
        )
    }

    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
                .preferredColorScheme(.dark) // Force dark mode for cosmic theme
        }
    }
}