//
//  h-index.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/28/24.
//

import Foundation

/*
 인용횟수가 많은 논문부터 내림차순으로 정렬
 인덱스 + 1 이 인용 횟수를 초과하는 순간을 찾으면 H-index 를 구할 수 있음
 */

func hIndex(_ citations:[Int]) -> Int {
    let sorted: [Int] = citations.sorted(by: >)
    var result: Int = 0
    
    for (index, value) in sorted.enumerated() {
        if index + 1 <= value {
            result = index + 1
        } else {
            break
        }
    }
    
    return result
}
