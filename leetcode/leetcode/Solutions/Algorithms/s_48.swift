//
//  s_48.swift
//  leetcode
//
//  Created by sykang on 2023/04/04.
//

import Foundation

struct s_48 {
  func rotate(_ matrix: inout [[Int]]) {
    var new = matrix
    let rCount = matrix.count
    let cCount = matrix[0].count
    
    for r in 0..<rCount {
      for c in 0..<cCount {
        new[r][c] = matrix[cCount-1-c][r]
      }
    }
    
    matrix = new
  }
}
