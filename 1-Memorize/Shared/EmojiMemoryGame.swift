//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 張書涵 on 2021/2/12.
//

import SwiftUI
import Combine

class EmojiMemoryGame: ObservableObject {
    
    //    private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory:{ (pairIndex: Int) -> String  in
    //        return "🍙"
    //    })
    //  simplified >>>>
    //    private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2){ _ in  "🍙" }
        
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    //static func = make this a function on the type
    static func createMemoryGame() -> MemoryGame<String> {
        let emoji = ["🍜","🍘"]
        return MemoryGame<String>(numberOfPairsOfCards: 2) { pairIndex in
            return emoji[pairIndex]
        }
    }
    
    
    
    //MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
}
