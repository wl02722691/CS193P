//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by 張書涵 on 2021/2/15.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
