//
//  Heap.swift
//  CodingTest
//
//  Created by Kim EenSung on 3/19/24.
//

import Foundation

struct Heap<T: Comparable> {
    private(set) var heap: [T] = []
    private let sortFunction: (T, T) -> Bool
    
    init(data: T, sortFunction: @escaping (T, T) -> Bool) {
        heap.append(data)
        self.sortFunction = sortFunction
    }
    
    func leftChild(_ index: Int) -> Int {
        return index * 2
    }
    
    func rightChild(_ index: Int) -> Int {
        return index * 2 + 1
    }
    
    func parent(_ index: Int) -> Int {
        return index / 2
    }
    
    func peek() -> T? {
        if heap.count < 1 { return nil }
        return heap[1]
    }
    
    mutating func insert(_ element: T) {
        let index = heap.count
        heap.append(element)
        jump(index)
    }
    
    mutating func jump(_ index: Int) {
        var index = index
        while index != 1 && self.sortFunction(heap[parent(index)], heap[index]) {
            heap.swapAt(parent(index), index)
            index = parent(index)
        }
    }
    
    mutating func pop() -> T? {
        if heap.count < 1 { return nil }
        heap.swapAt(1, heap.endIndex - 1)
        let root = heap.removeLast()
        
        dive(1)
        
        return root
    }
    
    mutating func dive(_ index: Int) {
        var current = index
        let leftIndex = leftChild(current)
        let rightIndex = rightChild(current)

        if leftIndex < heap.endIndex && sortFunction(heap[current], heap[leftIndex]) {
            current = leftIndex
        }
        
        if rightIndex < heap.endIndex && sortFunction(heap[current], heap[rightIndex]) {
            current = rightIndex
        }
        
        if current != index {
            heap.swapAt(index, current)
            dive(current)
        }
    }
}

