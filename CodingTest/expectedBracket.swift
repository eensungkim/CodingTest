//
//  expectedBracket.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/26/24.
//

import Foundation

/*
 라운드가 지날 때마다 승자의 번호가 n/2 번(반올림)이 되고,
 두 사람의 번호가 같아질 때 마무리된다는 것이 아이디어의 핵심
 */

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var result: Int = 0
    var a: Double = Double(a)
    var b: Double = Double(b)
    
    while a != b {
        a = round(a / 2)
        b = round(b / 2)
        result += 1
    }
    
    return result
}
