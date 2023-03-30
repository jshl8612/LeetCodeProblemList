//
//  s_97.swift
//  leetcode
//
//  Created by sykang on 2023/03/30.
//

import Foundation

struct s_97 {
  func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    
    if s1.count + s2.count != s3.count { return false }
    
    var dp = [[Int]: Bool]()
    
    func _isInterleave(_ c1: [Character], _ c2: [Character], _ c3: [Character],
                       _ i: Int = 0, _ j: Int = 0, _ k: Int = 0) -> Bool {
      
      let key = [i, j]
      
      if let v = dp[key] { return v }
      
      if i == c1.count { return Array(c2[j..<c2.count]) == Array(c3[k..<c3.count]) }
      if j == c2.count { return Array(c1[i..<c1.count]) == Array(c3[k..<c3.count]) }
      if i > c1.count { return false }
      if j > c2.count { return false }
      if k >= c3.count { return false }
      
      var result = false
      
      if c1[i] == c3[k] {
        result = result || _isInterleave(c1, c2, c3, i+1, j, k+1)
      }
      
      if c2[j] == c3[k] {
        result = result || _isInterleave(c1, c2, c3, i, j+1, k+1)
      }
      
      dp[key] = result
      return result
    }
    let result = _isInterleave(Array(s1), Array(s2), Array(s3), 0, 0, 0)
    
    print(dp)
    return result
  }
}
