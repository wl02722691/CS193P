//
//  EmojiMemoryGameView.swift
//  Shared
//
//  Created by 張書涵 on 2021/2/12.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
            .padding()
        }
        .padding()
        .foregroundColor(Color.orange )
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
             ZStack {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90))
                    .padding(5).opacity(0.4)
                Text(card.content).font(Font.largeTitle)
                    .font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width,size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
