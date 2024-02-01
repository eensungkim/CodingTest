//
//  returnMaxAndMinimumValue.swift
//  CodingTest
//
//  Created by Kim EenSung on 2/1/24.
//

import Foundation

func returnMaxAndMinimumValue(_ s:String) -> String {
    let splitString = s.split(separator: " ")
    var intArray = splitString.map { character in
        return Int(character)!
    }

    // 시간 초과로 실패하는 코드
//    intArray.sort(by: <)
//    return "\(intArray[0]) \(intArray[intArray.count - 1])"
    
    let maxInt = intArray.max(by: { leftInt, rightInt in
        return leftInt < rightInt
    })
    let minInt = intArray.min(by: { leftInt, rightInt in
        return leftInt < rightInt
    })
    
    return "\(minInt!) \(maxInt!)"
}

