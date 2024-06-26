//
//  carpet.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/26/24.
//

import Foundation

/*
 중앙에 위치한 yellow 타일 갯수의 곱셈쌍과 brown 타일의 갯수와의 비교를 알아내는 것이 문제를 푸는 힌트
 " 2 * (yellow 타일의 곱셈쌍1 + yellow 타일의 곱셈쌍2) + 4 == brown 타일의 갯수"
 일때 각각의 곱셈쌍 + 2 를 해주면 가로와 세로를 찾아낼 수 있음
 
 yellow == 1 을 별도 if 문으로 구성한 이유는, 효율적으로 곱셈쌍을 찾기 위해서 yellow / 2 만큼까지만 반복하기 위해 halfOfYellow 를 계산하고 있기 때문
 */

func carpet(_ brown:Int, _ yellow:Int) -> [Int] {
    if yellow == 1 { return [3, 3] }
    
    let halfOfYellow: Int = yellow / 2
    var result: [Int] = []
    
    for number in 1...halfOfYellow {
        if yellow % number == 0 {
            let pairNumber = yellow / number
            if brown == 2 * (number + pairNumber) + 4 {
                result = [number + 2, pairNumber + 2]
                break
            }
        }
    }
    
    return result.sorted(by: >)
}
