//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Amir Nourinia on 13.11.21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let viewModel = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            MemorizeGameView(viewModel: viewModel)
        }
    }
}
