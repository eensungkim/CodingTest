//
//  developFeature.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/28/24.
//

import Foundation

/*
 progresses 의 길이가 100개 이하라서 removeFirst() 를 사용해도 크게 지장이 없음
 만약 시간초과가 걱정된다면 queue 를 반대로 뒤집어서 removeLast() 를 쓰면 조금은 개선되지 않을까..?
 */

func developFeature(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var queue: [Int] = progresses
    var speeds: [Int] = speeds
    var result: [Int] = []
    
    while !queue.isEmpty {
        for index in 0..<queue.count {
            queue[index] += speeds[index]
        }
        
        var count: Int = 0
        while let first = queue.first, first >= 100 {
            queue.removeFirst()
            speeds.removeFirst()
            count += 1
        }
        if count > 0 { result.append(count) }
    }
    
    return result
}
