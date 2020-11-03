//
//  MatchingGame.swift
//  MatchingGame
//
//  Created by David Torres on 10/30/20.
//

import Foundation

struct MatchingGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        let cardIndex = cards.firstIndex(matching: card)
        cards[cardIndex].isFaceUp = !cards[cardIndex].isFaceUp
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
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
}
