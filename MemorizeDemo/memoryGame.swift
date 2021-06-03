//
//  memoryGame.swift
//  memorise-swiftUI
//
//  Created by Harriette Berndes on 02/06/2021.
//

import Foundation
 // this is the model
// model of our general memory game

struct MemoryGame<CardContent> {
    // what does this model do, lets get the vars in place to describe what the game does
    var cards: Array<Card>
    
    // almost all arguments for functions will have a label
    mutating func choose(card: Card) {
        // will have logic for the cards
        print("card chosen: \(card)")
        // we want to be able to flip the cards when chosen
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return -1 // TODO: fix this
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
    
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(isFaceUp: false, isMatched: false, content: content, id: pairIndex*2+1))
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: pairIndex*2))
        }
    }
    
    
    
    struct Card: Identifiable {
        // represents a single card
        var isFaceUp: Bool
        var isMatched: Bool
        // content could be multiple tyes
        // it is a 'don't care' type
        // will have to declare the type when we initialise a new game?
        var content: CardContent
        var id: Int
    }
}
