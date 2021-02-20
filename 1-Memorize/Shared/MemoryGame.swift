//
//  MemoryGame.swift
//  Memorize
//
//  Created by 張書涵 on 2021/2/12.
//

import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter{ cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let chooseIndex = cards.firstIndex(matching: card), !cards[chooseIndex].isFaceUp, !cards[chooseIndex].isMatched {
            
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chooseIndex].content == cards[potentialMatchIndex].content{
                    cards[chooseIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chooseIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chooseIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
