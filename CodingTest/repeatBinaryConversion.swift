//
//  repeatBinaryConversion.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/25/24.
//

import Foundation

func repeatBinaryConversion(_ s:String) -> [Int] {
    var count: Int = 0
    var removedZero: Int = 0
    
    var array: [Int] = Array(s).map { Int(String($0))! }
    while array.count > 1 {
        let length = array.count
        array = array.filter { $0 == 1 }
        removedZero += length - array.count
        array = toBinary(array.count)
        count += 1
    }
    
    return [count, removedZero]
}

/*
 바이너리로 변환하는 방법을 몰라서 아래 toBinary 함수를 만들어서 썼는데,
 String 이니셜라이저 중에 바이너리로 변경 가능한 이니셜라이저가 있었음
 https://developer.apple.com/documentation/swift/string/init(_:radix:uppercase:)
 
 String(Int, radix: 2) 와 같은 형태로 생성하면 주어진 숫자의 이진변환된 수를 문자열 형태로 보여줌
 
 */

func toBinary(_ number: Int) -> [Int] {
    var result: [Int] = []
    var originalNumber: Int = number
    while originalNumber > 1 {
        let quotient = originalNumber / 2
        let remainder = originalNumber % 2
        result.append(remainder)
        originalNumber = quotient
    }
    result.append(originalNumber)
    return result.reversed()
}
