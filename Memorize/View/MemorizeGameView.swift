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
    var body: some View {
        VStack {
            AspectVGrid(items: game.cards, aspectRatio: cp.cardAspectRatio){ card in
                CardView(card: card)
                    .padding()
                    .onTapGesture {
                        game.choose(card: card)
                    }
            }
            Button(action: {game.shuffle()}, label: {Text("Shuffle Cards").font(.largeTitle)})
        }
        if game.isFinished {
            VStack{
                Text("Game is Finished!").font(.largeTitle)
                Button(action: {game.reset()}, label: {Text("Reset Game.").font(.largeTitle)})
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
