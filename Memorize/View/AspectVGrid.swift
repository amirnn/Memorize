//
//  AspectVGrid.swift
//  Memorize
//
//  Created by Amir Nourinia on 09.12.21.
//

import SwiftUI

struct AspectVGrid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    
    let items : [Item]
    let aspectRatio : CGFloat
    let content: (Item) -> ItemView
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                LazyVGrid(columns: [adaptiveGridItem(for: geometry)], spacing: 0) {
                    ForEach(items) { item in
                        content(item)
                            .aspectRatio(aspectRatio, contentMode: .fit)
                    }
                }
                // To make Geomtry Reader is inside flexible.
                Spacer(minLength: 0)
            }
        }
    }
    
    private func adaptiveGridItem(for geometry: GeometryProxy) -> GridItem {
        let width = widthThatFits(in: geometry.size, itemAspecRatio: aspectRatio)
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
    
    // We assume there is no spacing.
    private func widthThatFits(in size: CGSize, itemAspecRatio: CGFloat) -> CGFloat {
        let itemCount = items.count
        var columnCount = 1
        var rowCount = itemCount
        repeat {
            let itemWidth = size.width / CGFloat(columnCount)
            let itemHeight = itemWidth / itemAspecRatio
            if CGFloat(rowCount) * itemHeight < size.height {
                break
            }
            columnCount += 1
            rowCount = (itemCount + (columnCount - 1)) / columnCount
        } while columnCount < itemCount
        if columnCount > itemCount {
            columnCount = itemCount
        }
        return floor(size.width / CGFloat(columnCount))
    }
}

//struct AspectVGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        let game = EmojiMemoryGame()
//        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: <#T##(_) -> _#>)
//    }
//}
