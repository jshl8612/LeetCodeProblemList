//
//  s_174.swift
//  leetcode
//
//  Created by sykang on 2023/04/03.
//

import Foundation

struct s_174 {
  func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
    let rowCount = dungeon.count
    let colCount = dungeon[0].count
    var healthDp = Array(repeating: Array(repeating: 1, count: colCount), count: rowCount)
    
    for i in (0..<rowCount).reversed() {
      for j in (0..<colCount).reversed() {
        switch (i, j) {
        case (rowCount-1, colCount-1):
          healthDp[i][j] = max(1, 1 - dungeon[i][j])
        case (rowCount-1, _):
          healthDp[i][j] = max(1, healthDp[i][j+1] - dungeon[i][j])
        case (_, colCount-1):
          healthDp[i][j] = max(1, healthDp[i+1][j] - dungeon[i][j])
        default:
          healthDp[i][j] = max(1, min(healthDp[i][j+1], healthDp[i+1][j]) - dungeon[i][j])
        }
      }
    }
    
    return healthDp[0][0]
  }
}
