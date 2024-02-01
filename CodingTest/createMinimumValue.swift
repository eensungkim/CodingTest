//
//  createMinimumValue.swift
//  CodingTest
//
//  Created by Kim EenSung on 2/1/24.
//

import Foundation

func createMinimumValue(_ A:[Int], _ B:[Int]) -> Int {
    let sortedA: [Int] = A.sorted(by: >)
    let sortedB: [Int] = B.sorted(by: <)

    var answer: Int = 0
    for i in 0..<sortedA.count {
        answer += sortedA[i] * sortedB[i]
    }
    return answer
}
