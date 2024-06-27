//
//  rotateBrackets.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/27/24.
//

import Foundation

func rotateBrackets(_ s:String) -> Int {
    var result: Int = 0
    var string: String = s
    for _ in 1...s.count {
        if isBrackets(string) {
            result += 1
        }
        let character = string.removeFirst()
        string += String(character)
    }
    
    return result
}


func isBrackets(_ s: String) -> Bool {
    var stack: [Character] = []
    for character in s {
        if let last = stack.last {
            if (last == "[" && character == "]") ||
            (last == "{" && character == "}") ||
            (last == "(" && character == ")") {
                stack.removeLast()
            } else {
                stack.append(character)
            }
        } else {
            stack.append(character)
        }
    }
    
    return stack.isEmpty
}
