//
//  clothes.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/28/24.
//

import Foundation

/*
 dictionary 로 모든 의상의 종류별 수를 기록하는 것은 쉬움.
 모든 조합의 수를 찾기 위한 공식? 미리 알고 있을 필요가 있어보임.
 이 상황에서는 n개의 종류의 의상이 a, b, ..., n 과 같이 있다고 할 때
 모든 조합의 수는 (a + 1) * (b + 1) * (c + 1) * ... * (n + 1) - 1 이 됨.
 */

func clothes(_ clothes:[[String]]) -> Int {
    var dictionary: [String: Int] = [:]
    clothes.forEach { cloth in
        if let count = dictionary[cloth[1]] {
            dictionary[cloth[1]] = count + 1
            return
        }
        dictionary[cloth[1]] = 1
    }
    
    let result: Int = dictionary.reduce(1) { acc, cur in
        return acc * (cur.value + 1)
    }

    return result - 1
}
