//
//  EmojiMatchingGame.swift
//  MatchingGame
//
//  Created by David Torres on 10/30/20.
//

import Foundation

class EmojiMatchingGame {
    private var model: MatchingGame<String> = EmojiMatchingGame.createMatchingGame()
    
    static func createMatchingGame() -> MatchingGame<String> {
        let cards = ["🥵", "👀", "🥺", "🥶", "😭"]
        return MatchingGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { index in
            return cards[index]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MatchingGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MatchingGame<String>.Card) {
        return model.choose(card: card)
    }
}
