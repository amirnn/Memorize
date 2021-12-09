//
//  AspectVGrid.swift
//  Memorize
//
//  Created by Amir Nourinia on 09.12.21.
//

import SwiftUI

struct AspectVGrid: View {
    let game : EmojiMemoryGame
    let cardAspectRatio : CGFloat
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: getCardMinWidth(geometry: geometry) ))]) {
                        ForEach(game.cards) { card in
                            CardView(card: card).aspectRatio( cardAspectRatio, contentMode: .fit)
                                .onTapGesture {
                                    game.choose(card: card)
                                }
                        }
                    }
            }
        }
    }
    
    private func getCardMinWidth(geometry: GeometryProxy) -> CGFloat {
        CGFloat(2/3)
    }
}

struct AspectVGrid_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        AspectVGrid(game: game, cardAspectRatio: CGFloat(2/3))
    }
}
