//
//  process.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/28/24.
//

import Foundation

func process(_ priorities:[Int], _ location:Int) -> Int {
    var queue: [(Int, Int)] = []
    var result: Int = 0
    
    for (index, value) in priorities.enumerated() {
        queue.append((index, value))
    }
    
    while !queue.isEmpty {
        guard let first = queue.first else { continue }
        if queue.contains(where: { $0.1 > first.1 }) {
            queue.removeFirst()
            queue.append(first)
        } else {
            queue.removeFirst()
            result += 1
            if first.0 == location { break }
        }
    }
    
    return result
}
