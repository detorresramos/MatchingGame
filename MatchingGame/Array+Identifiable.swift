//
//  Array+Identifiable.swift
//  MatchingGame
//
//  Created by David Torres on 11/2/20.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int {
        for index in 0..<self.count {
            if (self[index].id == matching.id) {
                return index
            }
        }
        return 0 // TODO: fix not found return
    }
}
