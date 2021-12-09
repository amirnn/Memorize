//
//  CardView.swift
//  Memorize
//
//  Created by Amir Nourinia on 12.11.21.
//

import SwiftUI

struct CardView: View {
    private typealias ns = CardView
    private typealias cp = ControlPanel
    
    let card: MemoryGameModel<String>.Card
    //    var content : String
    var body: some View {
        GeometryReader{ geometry in
            ZStack {
                let font = ns.useFont(for: geometry)
                Text(card.content).font(font).foregroundColor(cp.contentColor)
            }
            .cardifiy(isFaceUp: card.isFaceUp)
        }
    }
    
    static private func useFont(for geometry: GeometryProxy )-> Font {
        Font.system(size:  min(geometry.size.width,geometry.size.height) * cp.contentScale)
    }
    private struct ControlPanel {
        static let contentScale = 0.75
        static let contentColor : Color = .orange
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmojiMemoryGame()
        CardView(card: viewModel.cards[0])
    }
}
