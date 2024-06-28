//
//  deliverAndPick.swift
//  CodingTest
//
//  Created by Kim EenSung on 3/20/24.
//

import Foundation

func deliverAndPick(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var distance: Int = 0
    
    var ableToDeliver = 0
    var ableToPick = 0
    
    for index in stride(from: n - 1, through: 0, by: -1) {
        if deliveries[index] != 0 || pickups[index] != 0 {
            var oneWayCount = 0
            
            while ableToDeliver < deliveries[index] || ableToPick < pickups[index] {
                oneWayCount += 1
                ableToDeliver += cap
                ableToPick += cap
            }
            
            ableToDeliver -= deliveries[index]
            ableToPick -=  pickups[index]
            distance += (index + 1) * oneWayCount * 2
        }
    }
    
    return Int64(distance)
}
