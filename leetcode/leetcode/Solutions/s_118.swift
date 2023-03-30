//
//  s_118.swift
//  leetcode
//
//  Created by sykang on 2023/03/30.
//

import Foundation

struct s_118 {
  func generate(_ numRows: Int) -> [[Int]] {
    
    var dp = Array(repeating: [Int](), count: numRows+1)
    dp[1] = [1]
    
    if numRows < 2 { return [dp[numRows]] }
    if numRows > 30 { return [] }
    
    for i in 2...30 where i <= numRows {
      var arr = dp[i]
      
      for j in 0...dp[i-1].count {
        if j == 0 {
          arr.append(dp[i-1][0])
          continue
        }
        if j == dp[i-1].count {
          arr.append(dp[i-1][j-1])
          continue
        }
        
        arr.append(dp[i-1][j] + dp[i-1][j-1])
      }
  
      dp[i] = arr
    }
    
    return Array(dp[1...numRows])
  }
}
