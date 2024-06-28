//
//  tuple.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/28/24.
//

import Foundation

/*
 문자열을 [Int] 자료형으로 변환하는 방법은 좀 더 축약된 표현이 있지 않을까..
 
 result 생성 시 Set 를 활용할 수 있는 subtracting(_:) 메서드가 있다는 것을 알게되고 변경 적용
 https://developer.apple.com/documentation/swift/setalgebra/subtracting(_:)-h0n4
 
 기존 로직 대비 소요시간 단축
 
 var removed: [Int] = []
 var result: [Int] = array.reduce([]) { acc, element in
     var array: [Int] = element
     array.removeAll(where: { removed.contains($0) })
     removed.append(array[0])
     return acc + array
 }
 */

func tuple(_ s:String) -> [Int] {
    var cString: String = s
    cString.removeFirst()
    cString.removeLast()
    var array: [[Int]] = []
    
    var element: [Int] = []
    var numberString: String = ""
    cString.forEach { char in
        switch char {
        case "{":
            element = []
            numberString = ""
        case "}":
            element.append(Int(numberString)!)
            array.append(element)
        case ",":
            element.append(Int(numberString)!)
            numberString = ""
        case "0"..."9":
            numberString += String(char)
        default:
            return
        }
    }
    
    array.sort(by: { $0.count < $1.count })

    var result: [Int] = array.reduce([]) { acc, element in
        return acc + Array(Set(element).subtracting(Set(acc)))
    }
    
    return result
}
