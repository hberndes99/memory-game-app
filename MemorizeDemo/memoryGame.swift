//
//  memoryGame.swift
//  memorise-swiftUI
//
//  Created by Harriette Berndes on 02/06/2021.
//

import Foundation
 // this is the model
// model of our general memory game

struct MemoryGame<CardContent> where CardContent: Equatable {
    // what does this model do, lets get the vars in place to describe what the game does
    var cards: Array<Card>
    
    // we need this for game play
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            var faceUpCardIndices = [Int]()
            for index in cards.indices {
                if cards[index].isFaceUp {
                    faceUpCardIndices.append(index)
                }
            }
            if faceUpCardIndices.count == 1 {
                return faceUpCardIndices.first
            }
            else {
                return nil
            }
        }
        set {
            for index in cards.indices {
                if index == newValue {
                    cards[index].isFaceUp = true
                } else {
                cards[index].isFaceUp = false
                }
            }
        }
    }
    
    // almost all arguments for functions will have a label
    mutating func choose(card: Card) {
        // will have logic for the cards
        print("card chosen: \(card)")
        // we want to be able to flip the cards when chosen
        // comma is like a sequential and
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            // this only executes if chosen index isn't nil, and if the card is currently face down and not matched
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    // if the two cards have content that matches
                    // can only use == if we extend from equatable protocol
                    
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    print("mATCH")
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    /*
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return -1 // TODO: fix this
    }
 */
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
    
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(isFaceUp: false, isMatched: false, content: content, id: pairIndex*2+1))
            cards.append(Card(isFaceUp: false, isMatched: false, content: content, id: pairIndex*2))
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
