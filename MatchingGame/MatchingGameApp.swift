//
//  MatchingGameApp.swift
//  MatchingGame
//
//  Created by David Torres on 10/30/20.
//

import SwiftUI

@main
struct MatchingGameApp: App {
    let game = EmojiMatchingGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
