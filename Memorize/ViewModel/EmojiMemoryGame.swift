//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Amir Nourinia on 27.11.21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
//    @Published static private var numberOfPairOfCards = 3
    static let numberOfPairOfCards = 1
    static let theme: EmojiTheme = .vehicles
    static let emojis = theme.getEmojis()
    static func createMemoryGame(pairOfCards: Int) -> MemoryGameModel<String> {
        MemoryGameModel<String>(numberOfPairOfCards: numberOfPairOfCards) { emojis[$0] }
    }
    @Published private var model: MemoryGameModel<String> = createMemoryGame(pairOfCards: numberOfPairOfCards)
    
    var cards: [MemoryGameModel<String>.Card] {
        model.cards
    }
    func reset(){
        model = EmojiMemoryGame.createMemoryGame(pairOfCards: EmojiMemoryGame.numberOfPairOfCards)
    }
    //    MARK: Intents
    func choose(card: MemoryGameModel<String>.Card){
        model.choose(card)
    }
    func isFinished() -> Bool {
        model.isGameFinished
    }
}
