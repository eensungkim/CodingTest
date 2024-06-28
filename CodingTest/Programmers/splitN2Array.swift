//
//  splitN2Array.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/28/24.
//

import Foundation

/*
 아래 주석의 코드는 주어진 입출력 예시의 흐름대로 작성했던 코드
 테스트는 통과되지만 채점으로 넘어가면 시간초과 발생
 문제를 풀기 위한 핵심 개념은
 행렬의 들어가는 값은 x, y 좌표 중 더 큰 값을 기준으로 한다는 것
 + 1 을 해줘야 하는 이유는 배열의 index 는 0부터 시작하지만 들어가는 값은 1부터 시작하기 때문
 
 func splitN2Array(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
     var matrix: [[Int]] = Array(repeating: Array(repeating:0, count:n), count: n)
     for index in 0..<n {
         matrix[index][index] = index + 1
         for y in 0..<index {
             matrix[y][index] = index + 1
         }
         for x in 0..<index {
             matrix[index][x] = index + 1
         }
     }
    
     var result: [Int] = []
     for index in left...right {
         let y: Int = Int(index) / n
         let x: Int = Int(index) % n
         result.append(matrix[y][x])
     }
    
     return result
 }
 */

func splitN2Array(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var result: [Int] = []
    let left: Int = Int(left)
    let right: Int = Int(right)
    
    for index in left...right {
        let y = index / n
        let x = index % n
        let value = max(y, x) + 1
        result.append(value)
    }
    return result
}

 
