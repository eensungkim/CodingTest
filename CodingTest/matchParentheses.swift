//
//  matchParentheses.swift
//  CodingTest
//
//  Created by Kim EenSung on 2/1/24.
//

import Foundation

func matchParentheses(_ s:String) -> Bool {
    if s.starts(with: ")") {
        return false
    }
    
    var count: Int = 0
    let array = Array(s)

    for character in array {
        if character == "(" {
            count += 1
        }
        if character == ")" {
            count -= 1
        }
        if count < 0 {
            return false
        }
    }
    
    return count == 0 ? true : false
}
