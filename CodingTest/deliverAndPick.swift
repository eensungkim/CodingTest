//
//  deliverAndPick.swift
//  CodingTest
//
//  Created by Kim EenSung on 3/20/24.
//

import Foundation

func deliverAndPick(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var distance: Int = 0
    
    var delivered = 0
    var picked = 0
    
    for index in 1...n {
        let i = n - index
        if deliveries[i] != 0 || pickups[i] != 0 {
            var isFull = 0
            
            while delivered < deliveries[i] || picked < pickups[i] {
                isFull += 1
                delivered += cap
                picked += cap
            }
            
            delivered -= deliveries[i]
            picked -=  pickups[i]
            distance += (i + 1) * isFull * 2
        }
    }
    
    return Int64(distance)
}
