//
//  s_87.swift
//  leetcode
//
//  Created by sykang on 2023/03/29.
//

import Foundation

struct s_87 {
  func isScramble(_ s1: String, _ s2: String) -> Bool {
    var dp: [String: Bool] = [:]
    
    func _isScramble(_ s1: [Character], _ s2: [Character]) -> Bool {
      let key = "\(String(s1))_\(String(s2))"
      if let v = dp[key] {
        return v
      }
      
      if s1.count == 1 {
        return Array(s1)[0] == Array(s2)[0]
      }
      
      var result = false
      loop:
      for i in 1..<s1.count {
        result = result || ((_isScramble(Array(s1[0..<i]), Array(s2[0..<i])))
                            && _isScramble(Array(s1[i..<s1.count]), Array(s2[i..<s2.count])))
        
        result = result || ((_isScramble(Array(s1[0..<i]), Array(s2[s2.count-i..<s2.count])))
                            && _isScramble(Array(s1[i..<s1.count]), Array(s2[0..<s2.count-i])))
        
        if result {
          break loop
        }
      }
      
      dp[key] = result
      return result
      
    }
    let result = _isScramble(Array(s1), Array(s2))
    return result
  }
}
