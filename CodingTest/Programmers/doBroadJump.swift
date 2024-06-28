//
//  doBroadJump.swift
//  CodingTest
//
//  Created by Kim EenSung on 2/6/24.
//

import Foundation

func doBroadJump(_ n: Int) -> Int {
    let result: Int = fibonacci(n + 1)
    return result
}

var memoization: [Int: Int] = [:]

func fibonacci(_ n: Int) -> Int {
    if n <= 2 {
        return 1
    }
    
    guard let result = memoization[n] else {
        memoization[n] = (fibonacci(n - 1) &+ fibonacci(n - 2)) % 1234567
        return memoization[n]!
    }
    return result
}
