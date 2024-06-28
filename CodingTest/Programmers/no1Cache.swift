//
//  no1Cache.swift
//  CodingTest
//
//  Created by Kim EenSung on 6/28/24.
//

import Foundation

/*
 cache 에 검색하려는 도시가 있는 경우, cache 의 원래 위치에서 삭제 후 제일 뒤에 다시 넣어줘야 함.
 cache 의 크기가 0인 경우에는 바로 리턴하여 이후 로직에서 에러 발생하지 않도록 대응
 몇 번째에 위치해 있는지를 찾기 위해서 distance(from:to:) 를 활용했음
 */

func no1Cache(_ cacheSize:Int, _ cities:[String]) -> Int {
    if cacheSize == 0 { return cities.count * 5 }
    
    var result: Int = 0
    var cache: [String] = []
    
    cities.forEach { city in
        let city = city.lowercased()
        
        if cache.contains(city) {
            result += 1
            if let index = cache.firstIndex(of: city) {
                let intIndex = cache.distance(from: cache.startIndex, to: index)
                cache.remove(at: intIndex)
                cache.append(city)
            }
            return
        }
        
        result += 5
                    
        if cache.count >= cacheSize { cache.removeFirst() }
        cache.append(city)
    }
    
    return result
}
