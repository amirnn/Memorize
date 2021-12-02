//
//  MemorizeGameView.swift
//  Memorize
//
//  Created by Amir Nourinia on 13.11.21.
//

import SwiftUI

struct MemorizeGameView: View {
    private typealias cp = ControlPanel
    @ObservedObject var game: EmojiMemoryGame
//    let cardCount =EmojiMemoryGame.numberOfPairOfCards
//    var addButton : some View {
//        Button(action: {
//            if cardCount < emojiArray.count {
//                cardCount += 1
//            }
//        }) {
//            Image(systemName: "plus.circle")
//                .font(.largeTitle)
//                .padding(.horizontal)
//        }
//    }
//    var minusButton : some View {
//        Button(action: {
//            if cardCount > 0 {
//                cardCount -= 1
//            }
//        }, label: {
//            Image(systemName: "minus.circle")
//                .font(.largeTitle)
//                .padding(.horizontal)
//        })
//    }
//    var shuffleButton : some View {
//        Button(action:{
//            emojiArray.shuffle()
//        }, label: {
//            Text("Shuffle")
//                .font(.largeTitle)
//        } )
//    }
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: cp.cardMinmumWidth ))]) {
                    ForEach(game.cards) { card in
                        CardView(card: card).aspectRatio( cp.cardAspectRatio, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card: card)
                            }
                    }
                }
            }
//            Spacer()
//            HStack {
//                minusButton
//                Spacer()
//                shuffleButton
//                Spacer()
//                addButton
//            }
        }
        if game.isFinished() {
            VStack{
                Text("Game is Finished!")
                Button(action: {game.reset()}, label: {Text("Reset Game.")})
            }
            
        }
    }
    
    private struct ControlPanel {
        static let cardMinmumWidth: CGFloat = 65
        static let cardAspectRatio: CGFloat = 2 / 3
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmojiMemoryGame()
        MemorizeGameView(game: viewModel)
        MemorizeGameView(game: viewModel).preferredColorScheme(.dark)
    }
}
