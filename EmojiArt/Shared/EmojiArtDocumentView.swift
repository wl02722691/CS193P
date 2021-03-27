//
//  EmojiArtDocumentView.swift
//  Shared
//
//  Created by 張書涵 on 2021/3/27.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    
    @ObservedObject var document: EmojiArtDocument
    private let defaultEmojiSize: CGFloat = 40

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(EmojiArtDocument.palette.map {String($0)}, id: \.self) { emoji in
                        Text(emoji)
                            .font(Font.system(size: self.defaultEmojiSize))
                    }
                }
            }
            .padding(.horizontal)
            Rectangle().foregroundColor(.yellow)
                .edgesIgnoringSafeArea([.horizontal, .bottom])
        }
    }
    
}

// 如果不想所有的 String 都 Identifiable
// 可以用 id: \.self 的 key path 取代
//extension String: Identifiable {
//    public var id: String { return self }
//}
