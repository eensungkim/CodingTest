//
//  findIntegerCoordinateBetweenTwoCircles.swift
//  CodingTest
//
//  Created by Kim EenSung on 2/1/24.
//

import Foundation

// 원점(0, 0)에서 (x, y) 좌표까지의 거리는 x^2 + y^2 = 거리^2 이므로 x^2 + y^2 를 squareRoot 한 값
// 이 거리가 큰 원의 반지름보다 작거나 같고, 작은 원의 반지름보다는 크거나 같아야 함.
// 이 개념을 기반으로 하나의 사분면에 있는 점들을 계산한 뒤에 이 값을 4배로 곱하면 됨.

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
