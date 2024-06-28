//
//  multiplyMatrix.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/27/24.
//

import Foundation

/*
 행렬의 곱셈에는 3개의 변수가 있다는 것을 이해해야 함.
 행렬 A, B 를 곱하려면 A 행렬의 열 갯수와 B 행렬의 행 갯수가 일치해야 함
 따라서 행렬 A 와 B 를 아래와 같이 표현할 수 있음
 k 개의 열 * i 개의 행 으로 이루어진 행렬 A
 j 개의 열 * k 개의 행으로 이루어진 행렬 B
 이때 생성되는 행렬 AB는 j 개의 열 * i 개의 행으로 이루어짐
 
 k의 기준은 A의 열 또는 B의 행 중 어느 것으로 해도 무방
 중요한 것은 변하여 더해지는 값이 k에 기반한다는 것
 예를 들어 A의 0번째 행과 B의 1번째 열을 곱해서 더해야 한다고 할 때,
 A(0, 0) * B(0, 1)
 A(0, 1) * B(1, 1)
 A(0, 2) * B(2, 1)
 이 3개의 값을 더하는 것
 예시를 보면 A의 행 값과 B의 열 값은 바뀌지 않음, 바뀌는 것은 k 값(A의 열, B의 행)
 따라서 3중으로 반복하게 됨.
 */

func multiplyMatrix(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result: [[Int]] = []
    
    for i in 0..<arr1.count {
        var array: [Int] = []
        for j in 0..<arr2[0].count {
            var sum = 0
            for k in 0..<arr1[0].count {
                sum += arr1[i][k] * arr2[k][j]
            }
            array.append(sum)
        }
        result.append(array)
    }
    
    return result
}
