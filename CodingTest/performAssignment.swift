//
//  performAssignment.swift
//  CodingTest
//
//  Created by Kim EenSung on 2/1/24.
//

import Foundation

class Assignment {
    let name: String
    let start: Int
    var playtime: Int
    
    init(name: String, start: Int, playtime: Int) {
        self.name = name
        self.start = start
        self.playtime = playtime
    }
}

func performAssignment(_ plans:[[String]]) -> [String] {
    var tasks: [Assignment] = plans.map { plan in
        let splittedTimeString = plan[1].split(separator: ":")
        let start: Int = Int(splittedTimeString[0])! * 60 + Int(splittedTimeString[1])!
        return Assignment(name: plan[0], start: start, playtime: Int(plan[2])!)
    }
    
    tasks.sort { left, right in
        left.start < right.start
    }
    
    var finished: [Assignment] = []
    var notFinished: [Assignment] = []
    
    tasks.enumerated().forEach { index, task in
        if index + 1 == tasks.count {
            finished.append(task)
            return
        }
        
        let nextTask = tasks[index + 1]
        let availablePlaytimeUntilNextStart = nextTask.start - task.start
        let isTaskFinished: Bool = task.playtime - availablePlaytimeUntilNextStart <= 0
        
        if isTaskFinished {
            finished.append(task)
            var remainingTime = availablePlaytimeUntilNextStart - task.playtime
            while remainingTime > 0 && notFinished.count > 0 {
                if notFinished[0].playtime > remainingTime {
                    notFinished[0].playtime -= remainingTime
                    remainingTime = 0
                    break
                }
                
                remainingTime -= notFinished[0].playtime
                finished.append(notFinished[0])
                notFinished.remove(at: 0)
            }
            return
        }
        
        notFinished.insert(Assignment(name: task.name, start: task.start, playtime: task.playtime - availablePlaytimeUntilNextStart), at: 0)
    }
    
    var result: [String] = []
    finished.forEach { task in
        result.append(task.name)
    }
    notFinished.forEach { task in
        result.append(task.name)
    }
    
    return result
}
