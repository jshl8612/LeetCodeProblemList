//
//  s_64.swift
//  leetcode
//
//  Created by sykang on 2023/03/29.
//

import Foundation

struct s_64 {
  
  func minPathSum(_ grid: [[Int]]) -> Int {
    let rowCount = grid.count
    let colCount = grid[0].count
    var dp = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
    
    dp[0][0] = grid[0][0]
    
    for i in 0..<rowCount {
      for j in 0..<colCount {
        switch (i, j) {
        case (0, 0):
          break
        case (0, _):
          dp[i][j] = dp[i][j-1] + grid[i][j]
        case (_, 0):
          dp[i][j] = dp[i-1][j] + grid[i][j]
        default:
          dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i][j]
        }
      }
    }
    
    return dp[rowCount-1][colCount-1]
  }
}
