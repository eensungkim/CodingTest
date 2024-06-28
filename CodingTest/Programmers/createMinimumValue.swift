//
//  createMinimumValue.swift
//  CodingTest
//
//  Created by Kim EenSung on 2/1/24.
//

import Foundation

// 두 배열의 길이가 같다면, 한 배열의 가장 작은 수를 다른 배열의 가장 큰 수와 곱하고 그 결과를 더하면 되는 듯

func createMinimumValue(_ A:[Int], _ B:[Int]) -> Int {
    let sortedA: [Int] = A.sorted(by: >)
    let sortedB: [Int] = B.sorted(by: <)

    var answer: Int = 0
    for i in 0..<sortedA.count {
        answer += sortedA[i] * sortedB[i]
    }
    return answer
}
