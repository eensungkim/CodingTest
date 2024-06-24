//
//  researchMicroorganism.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/24/24.
//

import Foundation

func example() {
    let counts: Int = Int(readLine()!)!
    let input: String = readLine()!
    let array = input.split(separator: " ").enumerated().map { ($0 + 1, Int($1)!) }

    let result = absorb(array)
    print(result[0].1)
    print(result[0].0)

    func absorb(_ array: [(Int, Int)]) -> [(Int, Int)] {
        var stack: [(Int, Int)] = []
        var queueStack: [(Int, Int)] = array.reversed() // removeFirst() 의 시간복잡도가 너무 높아 역순으로 만든 뒤 removeLast() 로 접근하기 위함

        if array.count <= 1 { return array }

        while !queueStack.isEmpty {
            var (index, value) = queueStack.removeLast()
            
            if stack.isEmpty {
                if let rightValue = queueStack.last?.1, value >= rightValue {
                    queueStack.removeLast()
                    stack.append((index, value + rightValue))
                } else {
                    stack.append((index, value))
                }
                continue
            }
            
            if let leftValue = stack.last?.1, let rightValue = queueStack.last?.1, value >= leftValue && value >= rightValue {
                stack.removeLast()
                queueStack.removeLast()
                stack.append((index, value + leftValue + rightValue))
                continue
            }
        
            if let leftValue = stack.last?.1, value >= leftValue {
                stack.removeLast()
                stack.append((index, value + leftValue))
                continue
            }
        
            if let rightValue = queueStack.last?.1, value >= rightValue {
                queueStack.removeLast()
                stack.append((index, value + rightValue))
                continue
            }
        
            stack.append((index, value))
        }

        if stack.count > 1 {
            return absorb(stack)
        } else {
            return stack
        }
    }
}

