//
//  Array+Only.swift
//  Memorize
//
//  Created by 張書涵 on 2021/2/15.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
