//
//  ViewController.swift
//  Concentration
//
//  Created by MacBook Pro  on 1/9/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Variable and instances
    lazy var game = Concentration(numberOfParisOfCards: (cardButtons.count + 1) / 2)
    
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipLabel: UILabel!
    var flipCount = 0 {
        didSet {
            flipLabel.text  = "Flips: \(flipCount)"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender)
        {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
//            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
    
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for : card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 0) : #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
        }
    }

    var emojiChoices = ["👀", "🍏", "🍇", "🌝", "🐱", "🐛",  "🐸",  "🙈",  "🐟",
     "🐦",  "🐅",  "🐗",  "🦕",  "🐣",  "🐳",  "🦗"]
    
    var emoji = [Int : String]()
    
    func emoji(for card : Card) -> String {
        if emoji[card.identifier] == nil , emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }

}

