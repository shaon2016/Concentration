//
//  Concentration.swift
//  Concentration
//
//  Created by MacBook Pro  on 9/9/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import Foundation

class Concentration {
    var cards  = [Card]()
    // Hold One faced up card index
    var indexOfOneAndOnlyFacedUpCard : Int?
    
    func chooseCard(at index : Int)  {
        if let matchedCardIndex = indexOfOneAndOnlyFacedUpCard, index != matchedCardIndex {
            // indexOfOneAndOnlyFacedUpCard holds a card index
            // current choose card is another card
            if cards[index].identifier == cards[matchedCardIndex].identifier {
                cards[index].isMatched = true
                cards[matchedCardIndex].isMatched = true
            }
            // Current chosen card faced up. So it must be true
            cards[index].isFaceUp = true
            // Two card was shown. Only facedUpCard Variable must be set to nil.
            indexOfOneAndOnlyFacedUpCard = nil
        }
        else {
            // Either no cards or 2 cards are face up
            
            // First all card are reset
            for flipDownIndex in cards.indices {
                cards[flipDownIndex].isFaceUp = false
            }
            // A card must be faced up
            cards[index].isFaceUp = true
            // Hold the faced up card index for later matching
            indexOfOneAndOnlyFacedUpCard = index
        }
    
    }
    
    init(numberOfParisOfCards : Int) {
        for _ in 1...numberOfParisOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
    }
}
