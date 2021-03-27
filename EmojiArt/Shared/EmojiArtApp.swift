//
//  EmojiArtApp.swift
//  Shared
//
//  Created by 張書涵 on 2021/3/27.
//

import SwiftUI

@main
struct EmojiArtApp: App {

    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: EmojiArtDocument())
        }
    }
}
