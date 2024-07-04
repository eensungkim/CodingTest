//
//  pickTangerine.swift
//  CodingTest
//
//  Created by Kim EenSung on 4/9/24.
//

import Foundation

// Dictionary 초기화자를 활용하는 분이 있어서 참고
// grouping 초기화자를 사용할 경우 중복된 값을 배열의 형태로 정리해줌

func pickTangerine(_ k:Int, _ tangerine:[Int]) -> Int {
    let sorted = Dictionary(grouping: tangerine) { $0 }.values
        .sorted { $0.count > $1.count }
    
    var k: Int = k
    var result: Int = 0
    
    for item in sorted {
        k -= item.count
        result += 1
        if k <= 0 {
            return result
        }
    }
    
    return result
}
