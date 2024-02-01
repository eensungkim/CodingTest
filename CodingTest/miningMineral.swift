//
//  miningMineral.swift
//  CodingTest
//
//  Created by Kim EenSung on 2/1/24.
//

import Foundation

enum Pick {
    case diamond, iron, stone
    
    static subscript(index: Int) -> Pick {
        switch index {
        case 0:
            return .diamond
        case 1:
            return .iron
        case 2:
            return .stone
        default:
            return .stone
        }
    }
}

func pickMinerals(with pick: Pick, mineral: String) -> Int {
    switch pick {
    case .diamond:
        return 1
    case .iron:
        if mineral == "diamond" {
            return 5
        }
        return 1
    case .stone:
        switch mineral {
        case "diamond":
            return 25
        case "iron":
            return 5
        case "stone":
            return 1
        default:
            return 1
        }
    }
}

func miningMineral(_ picks:[Int], _ minerals:[String]) -> Int {
    // 전달받은 정보를 내부에서 변경하여 활용할 배열에 재할당
    var minableMinerals: [String] = minerals
    var availablePicks: [Int] = picks
    
    // 주어진 곡괭이로 캘 수 있는 광물만 남기고 제거
    let totalPicks = availablePicks.reduce(into: 0) { count, pick in
        count += pick
    }
    
    if minerals.count > totalPicks * 5 {
        minableMinerals.removeLast(minerals.count - totalPicks * 5)
    }
    
    // 가능한 광물들을 5개씩 끊어 이중 배열로 정리
    var sortedAvailableMinerals: [[String]] = []
    var arrayInsideSorted: [String] = []
    for (index, mineral) in minableMinerals.enumerated() {
        if index % 5 == 0 && index != 0 {
            sortedAvailableMinerals.append(arrayInsideSorted)
            arrayInsideSorted = []
        }
        arrayInsideSorted.append(mineral)
    }
    
    if arrayInsideSorted.count != 0 {
        sortedAvailableMinerals.append(arrayInsideSorted)
    }
    
    // 광물의 묶음을 돌 곡괭이 기준 난이도가 높은 순으로 정렬
    sortedAvailableMinerals.sort { leftArray, rightArray in
        let leftArrayDifficulty = leftArray.reduce(into: 0) { sum, mineral in
            sum += pickMinerals(with: .stone, mineral: mineral)
        }
        let rightArrayDifficulty = rightArray.reduce(into: 0) { sum, mineral in
            sum += pickMinerals(with: .stone, mineral: mineral)
        }
        
        return leftArrayDifficulty > rightArrayDifficulty
    }

    // 정렬된 광물들을 순차적으로 순회하며 난이도 합산
    var totalTiredness: Int = 0
    
    sortedAvailableMinerals.forEach { array in
        for (index, pick) in availablePicks.enumerated() {
            if pick < 1 {
                continue
            }
            
            let tiredness = array.reduce(into: 0) { sum, mineral in
                sum += pickMinerals(with: Pick[index], mineral: mineral)
            }
            totalTiredness += tiredness
            availablePicks[index] -= 1
            break
        }
    }
    
    return totalTiredness
}
