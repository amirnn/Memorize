//
//  CardView.swift
//  Memorize
//
//  Created by Amir Nourinia on 12.11.21.
//

import SwiftUI

struct CardView: View {
    private typealias cp = ControlPanel

    let card: MemoryGameModel<String>.Card
//    var content : String
    var body: some View {
        ZStack {
            if card.isFaceUp, !card.isMatched {
                RoundedRectangle(cornerRadius: cp.roundedRectangleCornerRadius)
                    .foregroundColor(cp.foregroundColor)
                RoundedRectangle(cornerRadius: cp.roundedRectangleCornerRadius).strokeBorder(lineWidth: cp.roundedRectangleBorderLineWidth, antialiased: true)
                    .foregroundColor(cp.borderColor)
                Text(card.content).font(.largeTitle).foregroundColor(cp.contentColor)
            }
            else if card.isMatched {
                RoundedRectangle(cornerRadius: cp.roundedRectangleCornerRadius).opacity(0)
            }
            else {
                RoundedRectangle(cornerRadius: cp.roundedRectangleCornerRadius)
                    .foregroundColor(cp.backColor)
            }
        }
    }
    
    private struct ControlPanel {
        static let foregroundColor : Color = .white
        static let backColor : Color = .orange
        static let borderColor : Color = .orange
        static let contentColor : Color = .orange
        static let roundedRectangleCornerRadius: CGFloat = 25
        static let roundedRectangleBorderLineWidth: CGFloat = 3
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmojiMemoryGame()
        CardView(card: viewModel.cards[0])
    }
}
