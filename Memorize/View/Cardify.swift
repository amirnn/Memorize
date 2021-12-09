//
//  Cardify.swift
//  Memorize
//
//  Created by Amir Nourinia on 09.12.21.
//

import SwiftUI

struct Cardify: ViewModifier {
    private typealias cp = ControlPanel
    let isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp
//                , !isMatched
            {
                RoundedRectangle(cornerRadius: cp.roundedRectangleCornerRadius)
                    .foregroundColor(cp.foregroundColor)
                RoundedRectangle(cornerRadius: cp.roundedRectangleCornerRadius).strokeBorder(lineWidth: cp.roundedRectangleBorderLineWidth, antialiased: true)
                    .foregroundColor(cp.borderColor)
                content
                //                Text(content).font(.system(size: fontSize)).foregroundColor(cp.contentColor)
            }
//            else if isMatched {
//                RoundedRectangle(cornerRadius: cp.roundedRectangleCornerRadius).opacity(0)
//            }
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
        static let roundedRectangleCornerRadius: CGFloat = 10
        static let roundedRectangleBorderLineWidth: CGFloat = 3
        
        
    }
}


extension View {
    func cardifiy(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
