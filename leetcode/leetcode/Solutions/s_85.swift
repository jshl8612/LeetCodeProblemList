//
//  s_85.swift
//  leetcode
//
//  Created by sykang on 2023/03/29.
//

import Foundation

struct s_85 {
  
  
  func maximalRectangle(_ matrix: [[Character]]) -> Int {
    if matrix.count == 0 || matrix[0].count == 0 { return 0 }
    var maxArea = 0
    var dp = matrix.map({$0.map({c in Int(String(c))!})})
    
    for i in 1..<matrix.count {
      for j in 0..<matrix[0].count {
        if dp[i][j] > 0 {
          dp[i][j] += dp[i-1][j]
        }
      }
    }
    
    for i in 0..<matrix.count {
      for j in 0..<matrix[0].count {
        if dp[i][j] > 0 {
          var minWidth = dp[i][j]
          maxArea = max(maxArea, minWidth)
          
        loop:
          for k in j..<matrix[0].count where k > j {
            if dp[i][k] == 0 {
              break loop
            }
            minWidth = min(minWidth, dp[i][k])
            maxArea = max(maxArea, minWidth*(k-j+1))
            
          }
        }
      }
    }
    
    return maxArea
  }
    
}
