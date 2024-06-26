//
//  leastCommonMultiple.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/26/24.
//

import Foundation

/*
 이래저래 수정을 많이 거친 버전.
 최대공약수와 최소공배수를 구하는 로직은 작성이 어렵지 않은 만큼 외워두면 쓸 일이 있을지도..
 */

func solution(_ arr:[Int]) -> Int {
    return arr.reduce(1) { lcm($0, $1) }
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return (a * b) / gcd(a, b)
}

func gcd(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b

    while b != 0 {
        let remainder = a % b
        a = b
        b = remainder
    }

    return a
}
