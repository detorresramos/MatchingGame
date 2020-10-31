//
//  MatchingGame.swift
//  MatchingGame
//
//  Created by David Torres on 10/30/20.
//

import Foundation

struct MatchingGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card chosen \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var content: CardContent
        var isFaceUp: Bool = true
        var isMatched: Bool = false
    }
}
