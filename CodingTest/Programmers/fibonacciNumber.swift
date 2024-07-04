//
//  fibonacciNumber.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/26/24.
//

import Foundation

/*
 피보나치 수열의 결과값을 저장할 때 %1234567 를 미리 붙이는 모듈러 연산
 모듈러 연산을 깊이 이해할 필요는 없더라도, 모듈러 연산을 모든 값에 적용하게 되면 결과도 동일하다는 것을 알아야 함
 모듈러 연산이 없다면 Int 로 처리할 수 있는 크기를 넘어서 일부 테스트케이스는 통과할 수 없음
 */

func fibonacciNumber(_ n:Int) -> Int {
    if n == 2 { return n }
    
    var fib1: Int = 1
    var fib2: Int = 1
    
    for _ in 3...n {
        let temp =  (fib1 + fib2) % 1234567
        fib1 = fib2
        fib2 = temp
    }
    
    return fib2
}
