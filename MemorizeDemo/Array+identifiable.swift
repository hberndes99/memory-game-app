//
//  Array+identifiable.swift
//  MemorizeDemo
//
//  Created by Harriette Berndes on 03/06/2021.
//

import Foundation

extension Array where Element: Identifiable {
    // returns an optional
    func firstIndex(matching:Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
