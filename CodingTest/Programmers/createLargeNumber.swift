//
//  createLargeNumber.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/24/24.
//

import Foundation

func createLargeNumber(_ number:String, _ k:Int) -> String {
    var stack = [Character]()  // 결과를 저장할 스택
    var removeCount = k        // 제거할 숫자의 개수

    for digit in number {
        // 스택이 비어 있지 않고, 제거할 수 있는 숫자가 남아 있고, 스택의 마지막 숫자가 현재 숫자보다 작으면
        while !stack.isEmpty && removeCount > 0 && stack.last! < digit {
            stack.removeLast() // 스택에서 마지막 숫자 제거
            removeCount -= 1   // 제거할 숫자 카운트 감소
        }
        stack.append(digit) // 현재 숫자를 스택에 추가
    }
    
    // 아직 제거할 숫자가 남아 있다면 뒤에서부터 제거
    while removeCount > 0 {
        stack.removeLast()
        removeCount -= 1
    }

    // 스택을 문자열로 변환하여 결과 반환
    return String(stack)
}
