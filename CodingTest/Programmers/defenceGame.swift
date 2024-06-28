//
//  defenceGame.swift
//  CodingTest
//
//  Created by Kim EenSung on 3/19/24.
//

import Foundation

func defenceGame(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    if k >= enemy.count {
        return enemy.count
    }
    
    var rounds: Int = 0
    var soldiers: Int = n
    var tickets: Int = k
    var defeated: Heap = Heap(data: Int.max, sortFunction: >)
    
    for enemyCount in enemy {
        if soldiers >= enemyCount {
            soldiers -= enemyCount
        } else if tickets > 0 {
            tickets -= 1
            guard let priorityEnemy = defeated.pop() else { return rounds }
            soldiers = soldiers - enemyCount + priorityEnemy
        } else {
            return rounds
        }
        rounds += 1
        defeated.insert(enemyCount)
    }
    
    return rounds
}
