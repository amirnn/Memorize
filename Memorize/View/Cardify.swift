//
//  Cardify.swift
//  Memorize
//
//  Created by Amir Nourinia on 09.12.21.
//

import SwiftUI



struct Cardify: ViewModifier {
    private typealias cp = ControlPanel
    
    let fontSize: CGFloat
    let isFaceUp: Bool
    let isMatched: Bool
    
    @ViewBuilder func body(content: Content) -> some View {
        
        ZStack {
            if isFaceUp, !isMatched {
                RoundedRectangle(cornerRadius: cp.roundedRectangleCornerRadius)
                    .foregroundColor(cp.foregroundColor)
                RoundedRectangle(cornerRadius: cp.roundedRectangleCornerRadius).strokeBorder(lineWidth: cp.roundedRectangleBorderLineWidth, antialiased: true)
                    .foregroundColor(cp.borderColor)
                Text(content).font(.system(size: fontSize)).foregroundColor(cp.contentColor)
            }
            else if isMatched {
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
        static let roundedRectangleCornerRadius: CGFloat = 25
        static let roundedRectangleBorderLineWidth: CGFloat = 3
        static let contentColor : Color = .orange
        static let contentScale : CGFloat = 0.8
    }
}


extension View {
    func cardifiy<Content>(this content: Content, geometry: GeometryProxy) -> some View {
        Cardify(fontSize: <#T##CGFloat#>, isFaceUp: <#T##Bool#>, isMatched: <#T##Bool#>)
    }
}
