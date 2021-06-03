//
//  EmojiMemoryGame.swift
//  memorise-swiftUI
//
//  Created by Harriette Berndes on 02/06/2021.
//

import Foundation

// an example of constrains and gains
// observableObject only works for classes
class EmojiMemoryGame: ObservableObject {
    
    // private means it can only be accessed by the EMojiMemory Game
    // but then no other views have access
    // published is a property wrapper
    // everytime this model changes it calls objectwillchange.send() to broadcast the change
    
   @Published private var myModel: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    //static func makes it a function on the type
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["😡", "😎", "💩"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // this is what you gain from being an observable object
    // a publisher meaning it can publish to the world when something changes
    // view will be interested in this
    // if you call send on this var then it publishes to the world
    // var objectWillChange: ObservableObjectPublisher
    
    // mark access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        return myModel.cards
    }
    // MARK intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        // this publishes o the world that the memory game model will change
        // doesn;t say how it will change
        // tells views looking to this view model that things will change
        // this way might be error prone
        // objectWillChange.send()
        myModel.choose(card: card)
    }
}
