//
//  findIntegerCoordinateBetweenTwoCircles.swift
//  CodingTest
//
//  Created by Kim EenSung on 2/1/24.
//

import Foundation

func findIntegerCoordinateBetweenTwoCircles(_ r1:Int, _ r2:Int) -> Int64 {
    var result: Int64 = 0
    let doubleR1 = Double(r1)
    let doubleR2 = Double(r2)
    for x in 1...r2 {
        let y2: Double = (pow(doubleR2, 2) - pow(Double(x), 2)).squareRoot()
        let y1: Double = {
            if pow(doubleR1, 2) - pow(Double(x), 2) < 0 {
                return 0
            }
            return (pow(doubleR1, 2) - pow(Double(x), 2)).squareRoot()
        }()
        let floorY2: Int = Int(y2)
        let floorY1: Int = Int(ceil(y1))
        let coordinate: Int = floorY2 - floorY1 + 1
        result += Int64(coordinate)
    }
    return result * 4
}
