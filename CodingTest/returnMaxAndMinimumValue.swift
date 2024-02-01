//
//  returnMaxAndMinimumValue.swift
//  CodingTest
//
//  Created by Kim EenSung on 2/1/24.
//

import Foundation

func returnMaxAndMinimumValue(_ s:String) -> String {
    let splitString = s.split(separator: " ")
    let intArray = splitString.map { character in
        return Int(character)!
    }
    print(intArray)
    let maxInt = intArray.max(by: { leftInt, rightInt in
        return leftInt < rightInt
    })
    let minInt = intArray.min(by: { leftInt, rightInt in
        return leftInt < rightInt
    })
    
    return "\(minInt!) \(maxInt!)"
}

