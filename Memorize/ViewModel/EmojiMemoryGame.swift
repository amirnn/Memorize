//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Amir Nourinia on 27.11.21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Model = MemoryGameModel<String>
    typealias Card = Model.Card
    typealias emg = EmojiMemoryGame
//    @Published static private var numberOfPairOfCards = 3
    static let numberOfPairOfCards = 5
    static let theme: EmojiTheme = .vehicles
    static let emojis = theme.getEmojis()
    static func createMemoryGame(pairOfCards: Int) -> Model {
        Model(numberOfPairOfCards: numberOfPairOfCards) { emojis[$0] }
    }
    @Published private var model = createMemoryGame(pairOfCards: numberOfPairOfCards)
    
    var cards: [Card] {
        model.cards
    }
    func reset(){
        model = emg.createMemoryGame(pairOfCards: emg.numberOfPairOfCards)
    }
    //    MARK: Intents
    func choose(card: Card){
        model.choose(card)
    }
    func isFinished() -> Bool {
        model.isGameFinished
    }
}
