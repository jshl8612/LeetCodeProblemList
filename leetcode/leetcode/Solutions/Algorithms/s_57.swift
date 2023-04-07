//
//  s_57.swift
//  leetcode
//
//  Created by sykang on 2023/04/04.
//

import Foundation

struct s_57 {
  func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    guard intervals.isEmpty == false else { return [newInterval] }
    
    var result: [[Int]] = []
    var new: [Int] = newInterval
    var added: Bool = false
    
    for inter in intervals {
      if inter[1] < new[0] {
        result.append(inter)
        continue
      }
      
      if inter[0] > new[1] {
        if added == false {
          result.append(new)
          added = true
        }
        result.append(inter)
        continue
      }
      if (inter[0]...inter[1]).contains(newInterval[0]) || (inter[0]...inter[1]).contains(newInterval[1]) {
        new[0] = min(inter[0], newInterval[0])
        new[1] = max(inter[1], newInterval[1])
      }
      
      if added {
        result.removeLast()
      }
      result.append(new)
    }
    
    return result
  }
}
