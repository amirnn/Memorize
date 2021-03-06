//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by Amir Nourinia on 27.11.21.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable {
    
    private(set) var cards: [Card]
    private var matchedCards: [Card] {cards.filter { $0.isMatched}}
    private var chosenCards: [Card] {cards.filter{$0.isFaceUp}}
    private var theOnlyFaceUpCard: Card? {
        get { chosenCards.oneAndOnly }
        set {
            // TODO: Test this
            // We wont set it to nil but to be sure it will work regardeless:
            // Turn all the cards face down.
            cards.indices.forEach { cards[$0].isFaceUp = false}
            // Except the only face up card
            if let card = newValue {
                cards.indices.forEach { cards[$0].isFaceUp = (cards[$0].id == card.id)}
            }
        }
    }
    var isGameFinished : Bool { matchedCards.count == cards.count }
    
    init(numberOfPairOfCards: Int , factoryFunction: (Int)->CardContent){
        cards = []
        for index in 0..<numberOfPairOfCards {
            let id = 2 * index
            cards.append( Card(id: id, content: factoryFunction(index)))
            cards.append( Card(id: id + 1, content: factoryFunction(index)))
        }
        cards.shuffle()
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    //    MARK: MV -> Model, Intents
    mutating func choose(_ card: Card){
        // Suppose we have a chosen card, and it is a match, and it is not the same previously selected card
        if let chosenCard = theOnlyFaceUpCard,
           chosenCard.content == card.content,
           chosenCard.id != card.id
        {
            // set isMatched for the first chosenCard (the only face up card)
            if let index = cards.firstIndex(where: {$0.id == chosenCard.id}) {
                cards[index].isMatched = true
                cards[index].isFaceUp = false
            }
            // set isMatched for the second chosen Card
            if let index = cards.firstIndex(where: {$0.id == card.id}) {
                //                cards[index].isMatched.toggle()
                cards[index].isMatched = true
                cards[index].isFaceUp = false
            }
        }
        //Suppose we have a chose card, but our second choice was the same card
        else if let chosenCard = theOnlyFaceUpCard,
                chosenCard.id == card.id {
            if let index = cards.firstIndex(where: {$0.id == card.id}) {
                cards[index].isFaceUp.toggle()
            }
            theOnlyFaceUpCard = nil
        }
        // Suppose we have a chosen card, but our second choice was not a match
        else if let chosenCard = theOnlyFaceUpCard,
                chosenCard.content != card.content {
            if let index = cards.firstIndex(where: {$0.id == card.id}) {
                //                cards[index].isMatched.toggle()
                cards[index].isFaceUp = true
            }
        }
        
        // There was no TheOnlyFaceUpCard
        else {
            if let index = cards.firstIndex(where: {$0.id == card.id}) {
                theOnlyFaceUpCard = cards[index]
                cards[index].isFaceUp = true
            }
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched:  Bool = false
        let content: CardContent
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return self.first
        }
        return nil
    }
}
