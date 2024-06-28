//
//  englishWordChain.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/26/24.
//

import Foundation

/*
 Dictionary.keys.contains() 로 단어의 중복을 체크할 경우 반복이 늘어나 시간 제한 초과가 되어버림
 
 n 명이 게임을 진행하다가 i 번째 단어에서 탈락하는 경우, i % n 을 하여 구할 수 있음
 이때 index 는 0부터 시작하기 때문에 마지막에 + 1 을 넣어 i % n + 1 으로 계산
 마찬가지로 해당하는 사람이 언제 탈락하는지 또한 i / n + 1 으로 확인 가능
 */

func englishWordChain(_ n:Int, _ words:[String]) -> [Int] {
    var dictionary: [String: Int] = [:]
    var previousCharacter: Character = words[0].first!
    
    for (index, word) in words.enumerated() {
        if previousCharacter == word.first! && dictionary[word] == nil {
            dictionary[word] = index // index 대신 아무 숫자나 넣어도 관계 없음
            previousCharacter = word.last!
            continue
        }
        
        return [ index % n + 1, index / n + 1]
    }
    return [0, 0]
}
