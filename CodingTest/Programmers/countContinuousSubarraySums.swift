//
//  countContinuousSubarraySums.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/27/24.
//

import Foundation

/*
 i, j 와 같은 인덱스를 잘 다루는 방법에 익숙해질 필요가 있음
 처음에는 3중 반복으로 진행해서 실행 시간이 너무 길었음
 아래의 코드는 n 번 인덱스부터 시작해서 주어진 배열의 길이만큼 반복해가며 sum을 누적해나가는 것
 이때 마지막을 넘어가는 인덱스의 경우 나머지 연산을 통해 다시 앞으로 돌아갈 수 있는 것이 포인트
 */

func countContinuousSubarraySums(_ elements:[Int]) -> Int {
    var result = Set<Int>()
    
    for i in 0..<elements.count {
        var sum = elements[i]
        result.insert(sum)
        for j in (i + 1)..<(i + elements.count) {
            sum += elements[j % elements.count]
            result.insert(sum)
        }
    }
    
    return result.count
}
