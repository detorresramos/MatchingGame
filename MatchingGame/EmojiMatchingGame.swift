//
//  EmojiMatchingGame.swift
//  MatchingGame
//
//  Created by David Torres on 10/30/20.
//

import SwiftUI
import Foundation

class EmojiMatchingGame: ObservableObject {
    @Published private var model: MatchingGame<String> = EmojiMatchingGame.createMatchingGame()
    private static var theme: Theme = EmojiMatchingGame.getRandomTheme()
    
    static func createMatchingGame() -> MatchingGame<String> {
        return MatchingGame<String>(numberOfPairsOfCards: theme.numCards/2) { index in
            return theme.emojis[index]
        }
    }
    
    static func getRandomTheme() -> Theme {
        return themes[Int.random(in: 0..<themes.count)]
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MatchingGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MatchingGame<String>.Card) {
        return model.choose(card: card)
    }
    
    func newGame() {
        EmojiMatchingGame.theme = EmojiMatchingGame.getRandomTheme()
        model = EmojiMatchingGame.createMatchingGame()
    }
    
    func getColor() -> Color {
        return EmojiMatchingGame.theme.color
    }
    
    func getThemeName() -> String {
        return EmojiMatchingGame.theme.name
    }
}

struct Theme {
    var name: String
    var emojis: [String]
    var numCards: Int
    var color: Color
}

var themes: [Theme] = [
    Theme(name: "Halloween", emojis: ["👻", "🎃", "🕷"], numCards: 6, color: Color.orange),
    Theme(name: "Christmas", emojis: ["☃️", "🎄", "🎅", "🦌", "❄️", "☕️"], numCards: 12, color: Color.red),
    Theme(name: "Food", emojis: ["🍎", "🍕", "🍦", "🥑", "🍷"], numCards: Int.random(in: 6...12), color: Color.black),
    Theme(name: "Beta Teja", emojis: ["🤡", "🍨", "🐙", "🥺", "😴", "🥽"], numCards: 12, color: Color.purple),
    Theme(name: "More Beta Balding Dave", emojis: ["😡", "👨‍🦲", "👨‍💻", "🙈", "🅱️", "🧠"], numCards: 12, color: Color.blue)
]


