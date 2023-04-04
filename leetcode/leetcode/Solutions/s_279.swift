//
//  s_279.swift
//  leetcode
//
//  Created by sykang on 2023/04/03.
//

import Foundation

struct s_279 {
  func numSquares(_ n: Int) -> Int {
    var dp = Array(0...n)
    
    for i in 1...n {
      var j = 1
      
      while j * j <= i {
        dp[i] = min(dp[i], dp[i - j * j] + 1)
        j += 1
      }
    }
    
    return dp[n]
  }
  
}
