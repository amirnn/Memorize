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
    private typealias ns = EmojiMemoryGame // namespace
    //    @Published static private var numberOfPairOfCards = 3
    static let numberOfPairOfCards = 5
    static let theme: EmojiTheme = .vehicles
    static let emojis = theme.getEmojis()
    static func createMemoryGame(pairOfCards: Int) -> Model {
        Model(numberOfPairOfCards: numberOfPairOfCards) { emojis[$0] }
    }
    @Published private var model = createMemoryGame(pairOfCards: numberOfPairOfCards)
    
    
    func reset(){
        model = ns.createMemoryGame(pairOfCards: ns.numberOfPairOfCards)
    }
    
    
    //    MARK: Get
    var isFinished: Bool {
        model.isGameFinished
    }
    var cards: [Card] {
        model.cards
    }
    
    //    MARK: Intents
    func choose(card: Card){
        withAnimation{
            model.choose(card)
        }
    }
    func shuffle(){
        withAnimation{
            model.shuffle()
        }
    }
}
