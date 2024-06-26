//
//  jumpAndTeleportation.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/26/24.
//

import Foundation

/*
 첫 코드는 보기엔 깔끔했지만 아쉽게도 효율성 테스트를 하나도 통과하지 못함..
 억에 해당하는 수가 2진수 문자열로 변환되면서 문자열이 너무 길어져 효율이 떨어진 것으로 추정
 func jumpAndTeleportation(_ n:Int) -> Int
 {
     return String(n, radix: 2).replacingOccurrences(of: "0", with: "").count
 }
 */

func jumpAndTeleportation(_ n:Int) -> Int
{
    var copied: Int = n
    var result: Int = 0
    while copied > 1 {
        if copied % 2 == 1 {
            result += 1
        }
        copied /= 2
    }
    return result + 1
}
