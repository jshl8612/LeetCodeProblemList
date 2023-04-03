//
//  s_221.swift
//  leetcode
//
//  Created by sykang on 2023/04/03.
//

import Foundation

struct s_221 {
  func maximalSquare(_ matrix: [[Character]]) -> Int {
    let rowCount = matrix.count, colCount = matrix[0].count
    var dp = Array(repeating: Array(repeating: 0, count: colCount+1), count: rowCount+1)
    var maxWidth = 0
    
    for i in 1...rowCount {
      for j in 1...colCount {
        let c = matrix[i-1][j-1]
        if c == "1" {
          dp[i][j] = min(dp[i-1][j-1], dp[i-1][j], dp[i][j-1]) + 1
        } else {
          dp[i][j] = 0
        }
        
        maxWidth = max(maxWidth, dp[i][j])
      }
    }
    
    return maxWidth*maxWidth
  }
}
