//
//  fatigue.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/28/24.
//

import Foundation

/*
 내가 작성한 코드는 순열을 활용해서 가능한 모든 조합의 방문 순서를 나열하고, 최대값을 뽑아내는 방식.
 
 아래 다른 사람의 풀이를 보면 조금 더 깔끔해보이는데,
 삼항 연산자의 true 부분의 filter 의 조건식이 조금 이해가 안됨, 나중에 고민해 봐야겠음
 elem in dungeon != elem 이면
 map 으로 들어와서 마주쳤던 던전과, dungeons 의 던전을 각각 비교해서 다른 것만을 남긴다는 것 같은데
 똑같은 던전이 여러 개 있어도 문제 없이 동작하는 이유는 뭐지..?
 
 func solution(_ k: Int, _ dungeons: [[Int]]) -> Int {
     return explore(k, dungeons, 0)
 }

 private func explore(_ k: Int, _ dungeons: [[Int]], _ depth: Int) -> Int {
     return dungeons.map { dungeon in
         k >= dungeon[0] ? explore(k - dungeon[1], dungeons.filter { elem in dungeon != elem }, depth + 1) : depth
     }.max() ?? depth
 }
 */

func fatigue(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var permutations: [[[Int]]] = []
    
    func permute(_ arr: [[Int]], start: Int, permutations: inout [[[Int]]]) {
        if start == arr.count - 1 {
            permutations.append(arr)
            return
        }
        
        for i in start..<arr.count {
            var newArray = arr
            newArray.swapAt(start, i)
            permute(newArray, start: start + 1, permutations: &permutations)
        }
    }

    permute(dungeons, start: 0, permutations: &permutations)

    var result: [Int] = []
    permutations.forEach { ordered in
        var k = k
        var count = 0
        for dungeon in ordered {
            if k >= dungeon[0] {
                k -= dungeon[1]
                count += 1
            }
        }
        result.append(count)
    }
    
    return result.max()!
}
