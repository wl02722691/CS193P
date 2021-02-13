//
//  MemorizeApp.swift
//  Shared
//
//  Created by 張書涵 on 2021/2/12.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
