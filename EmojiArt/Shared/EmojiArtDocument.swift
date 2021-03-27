//
//  EmojiArtDocument.swift
//  EmojiArt
//
//  Created by 張書涵 on 2021/3/27.
//

import SwiftUI

class EmojiArtDocument: ObservableObject {
    
    static let palette: String = "😣🥰🙋‍♀️🚌🌸✨❤️"
    
    @Published private var emojiArt: EmojiArt = EmojiArt()
    
    @Published private(set) var backgroundImage: UIImage?
    
    //MARK - Intent(s)
    
    func addEmoji(_ emoji: String, at location: CGPoint, size: CGFloat) {
        emojiArt.addEmoji(emoji, x: Int(location.x), y: Int(location.y), size: Int(size))
    }
    
    func moveEmoji(_ emoji: EmojiArt.Emoji, by offset: CGSize) {
        if let index = emojiArt.emojis.firstIndex(matching: emoji) {
            emojiArt.emojis[index].x += Int(offset.width)
            emojiArt.emojis[index].y += Int(offset.height)
        }
    }
    
    func scaleEmoji(_ emoji: EmojiArt.Emoji, by scale: CGFloat) {
        if let index = emojiArt.emojis.firstIndex(matching: emoji) {
            emojiArt.emojis[index].size = Int((CGFloat(emojiArt.emojis[index].size) * scale).rounded(.toNearestOrEven))
        }
    }
    
    
    func setBackgroundURL(_ url: URL?) {
        emojiArt.backgroundURL = url?.imageURL
        fetchBackgroundImageData()
    }
    
    func fetchBackgroundImageData() {
        backgroundImage = nil
        // 抓 Data 可能會很久, 為了不要 block UI 所以抓取資料要用 global queue
        if let url = self.emojiArt.backgroundURL {
            DispatchQueue.global(qos: .userInitiated).async {
                if let imageData = try? Data(contentsOf: url) {
                    // update UI 要切回 main thread
                    DispatchQueue.main.async {
                        // 為了避免 reload 太慢抓太多次圖, 所以再判斷一次 self.emojiArt.backgroundURL
                        if url == self.emojiArt.backgroundURL {
                            self.backgroundImage = UIImage(data: imageData)
                        }
                    }
                }
            }
        }
    }
}
