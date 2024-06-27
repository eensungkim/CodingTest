//
//  saleEvent.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/27/24.
//

import Foundation

func saleEvent(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var split = Array(discount.prefix(9))
    var dictionary: [String: Int] = {
        var dictionary: [String: Int] = [:]
        for (index, item) in want.enumerated() {
            dictionary[item] = number[index]
        }
        return dictionary
    }()
    var result: Int = 0
    
    for index in 9..<discount.count {
        split.append(discount[index])
        if isDiscounted(dictionary, split) {
            result += 1
        }
        split.removeFirst()
    }
    
    return result
}

func isDiscounted(_ dictionary: [String : Int], _ discount: [String]) -> Bool {
    var dictionary = dictionary
    for item in discount {
        guard let count = dictionary[item] else { return false }
        if count == 0 { return false }
        dictionary[item] = count - 1
    }
    return true
}
