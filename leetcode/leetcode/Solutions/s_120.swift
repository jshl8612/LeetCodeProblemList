//
//  s_120.swift
//  leetcode
//
//  Created by sykang on 2023/03/30.
//

import Foundation

struct s_120 {
  func minimumTotal(_ triangle: [[Int]]) -> Int {
    let n = triangle.count
    var dp = triangle
    
    for i in 1...n where i < n {
      
      for j in 0...i {
        if j == 0 {
          dp[i][j] += dp[i-1][j]
          continue
        }
        
        if j == i {
          dp[i][j] += dp[i-1][j-1]
          continue
        }
        
        dp[i][j] += min(dp[i-1][j-1], dp[i-1][j])
      }
    }
    
    
    return dp[n-1].min() ?? 0
  }
}
