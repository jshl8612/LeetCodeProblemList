//
//  s_115.swift
//  leetcode
//
//  Created by sykang on 2023/03/30.
//

import Foundation

struct s_115 {
  func numDistinct(_ s: String, _ t: String) -> Int {
    var dp: [[Int]: Int] = [:]
    func helper(_ c1: [Character], _ c2: [Character], _ i: Int, _ j: Int) -> Int {
      var count = 0
      if j == c2.count {
        return 1 }
      if c1.count - i < c2.count - j {
        return 0 }
      if c1.count - i == c2.count - j {
        return Array(c1[i..<c1.count]) == Array(c2[j..<c2.count]) ? 1 : 0 }
      if i == c1.count-1 { return
        c2[j..<c2.count].filter({$0 == c1[i]}).count }
      
      if let v = dp[[i,j]] {
        return v
      }
      
      for k in i..<c1.count {
        if c1[k] == c2[j] {
          count += helper(c1, c2, k+1, j+1)
        }
      }
      
      dp[[i,j]] = count
      
      return count
    }
    
    return helper(Array(s), Array(t), 0, 0)
  }
  
}
