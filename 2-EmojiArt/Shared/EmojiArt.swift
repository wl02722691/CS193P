//
//  EmojiArt.swift
//  EmojiArt
//
//  Created by 張書涵 on 2021/3/27.
//

import SwiftUI

struct EmojiArt: Codable {
    var backgroundURL: URL?
    var emojis = [Emoji]()
    
    struct Emoji: Identifiable, Codable {
        let text: String
        var x: Int // offset from center
        var y: Int // offset from center
        var size: Int
        var id: Int
        
        // fileprivate for addEmoji
        fileprivate init(text: String, x: Int, y: Int, size: Int, id: Int) {
            self.text = text
            self.x = x
            self.y = y
            self.size = size
            self.id = id
        }
    }
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init?(json: Data?) {
        if let json = json , let newEmojiArt = try? JSONDecoder().decode(EmojiArt.self, from: json) {
            self = newEmojiArt
        } else {
            return nil
        }
    }
    
    init() {}
    
    private var uniqueEmojiId = 0
    
    mutating func addEmoji(_ text:String, x: Int, y: Int, size: Int) {
        uniqueEmojiId += 1
        emojis.append(Emoji(text: text, x: x, y: y, size: size, id: uniqueEmojiId))
    }
    
}

extension EmojiArt.Emoji {
    var fontSize: CGFloat { CGFloat(self.size) }
    var location: CGPoint { CGPoint(x: CGFloat(x), y: CGFloat(y)) }
}
