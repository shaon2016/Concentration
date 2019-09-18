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
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
        
    }
    
//    func chooseCard(at index : Int)  {
//        if let matchedCardIndex = indexOfOneAndOnlyFacedUpCard, index != matchedCardIndex {
//            // indexOfOneAndOnlyFacedUpCard holds a card index
//            // current choose card is another card
//            if cards[index].identifier == cards[matchedCardIndex].identifier {
//                cards[index].isMatched = true
//                cards[matchedCardIndex].isMatched = true
//            }
//            // Current chosen card faced up. So it must be true
//            cards[index].isFaceUp = true
//            // Two card was shown. Only facedUpCard Variable must be set to nil.
//            indexOfOneAndOnlyFacedUpCard = nil
//        }
//        else {
//            // Either no cards or 2 cards are face up
//
//            // First all card are reset
//            for flipDownIndex in cards.indices {
//                cards[flipDownIndex].isFaceUp = false
//            }
//            // A card must be faced up
//            cards[index].isFaceUp = true
//            // Hold the faced up card index for later matching
//            indexOfOneAndOnlyFacedUpCard = index
//        }
//
//    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)) : Choosen index out of range")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)) : You must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        //    TODO: Shuffle the cards
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
