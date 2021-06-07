//
//  ContentView.swift
//  memorise-swiftUI
//
//  Created by Harriette Berndes on 02/06/2021.
//

import SwiftUI

// THIS IS THE VIEW
// wants to reflect the current state of the model

struct ContentView: View {
    // a pointer to the class
    // everytime it sees this view model publish about changes
    // by adding the observed object tag it does this
    // then everytime alterations are published it will redraw
    @ObservedObject var myViewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            Button("new game") {
                myViewModel.newGame()
            }
            ForEach(myViewModel.cards) { card in
                CardView(card: card).onTapGesture(perform: {
                    myViewModel.choose(card: card)
                })
            }
        }.padding()
    }
    
    
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader (content: { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth).foregroundColor(.purple)
                    Text(card.content)
                }
                else {
                    if !card.isMatched{
                        RoundedRectangle(cornerRadius: cornerRadius).fill(Color.purple)
                        
                    }
                }
                
            }.font(Font.system(size: min(geometry.size.width, geometry.size.height) * fontScaleFactor))
        })
        
    }
    // MARK: - DRAWING CONSTANTS
    // to fix up magic numbers in the view
    // values need to be CGFloat
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(myViewModel: EmojiMemoryGame())
    }
}
