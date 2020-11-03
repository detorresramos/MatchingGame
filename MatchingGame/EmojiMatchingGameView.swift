//
//  ContentView.swift
//  MatchingGame
//
//  Created by David Torres on 10/30/20.
//

import SwiftUI

struct EmojiMatchingGameView: View {
    @ObservedObject var viewModel: EmojiMatchingGame
    
    var body: some View {
        VStack {
            Text(viewModel.getThemeName())
            Grid(items: viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(viewModel.getColor())
            Button("New Game", action: {viewModel.newGame()})
        }
    }
}

struct CardView: View {
    var card: MatchingGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: lineWidth)
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
            .font(Font.system(size: fontSize(for: geometry.size)))
        }
    }
    
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10
    let lineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        return min(size.height, size.width) * 0.75
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMatchingGameView(viewModel: EmojiMatchingGame())
    }
}
