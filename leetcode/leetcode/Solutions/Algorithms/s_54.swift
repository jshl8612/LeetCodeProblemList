//
//  s_54.swift
//  leetcode
//
//  Created by sykang on 2023/04/12.
//

import Foundation

struct s_54 {
  //Spiral matrix
  func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    guard matrix.isEmpty == false else { return [] }
    
    let m = matrix.count
    let n = matrix[0].count
    
    let directions = [(0,1), (1,0), (0,-1), (-1,0)]
    
    var cur = (0, 0)
    var curDir = 0
    
    var rowRange = (0, m-1)
    var colRange = (0, n-1)
    
    var result = Array(repeating: 0, count: m*n)
    result[0] = matrix[0][0]
    var index = 1
    
    while index < result.count {
      
      let next = (cur.0 + directions[curDir].0, cur.1 + directions[curDir].1)
    
      switch next {
      case (...(rowRange.0-1), _):
        colRange.0 += 1
        curDir = (curDir+1)%4
        break
      case ((rowRange.1+1)..., _):
        colRange.1 -= 1
        curDir = (curDir+1)%4
        break
      case (_, ...(colRange.0-1)):
        rowRange.1 -= 1
        curDir = (curDir+1)%4
        break
      case (_, (colRange.1+1)...):
        rowRange.0 += 1
        curDir = (curDir+1)%4
        break
      default:
        break
      }
      
      cur.0 += directions[curDir].0
      cur.1 += directions[curDir].1
      
      result[index] = matrix[cur.0][cur.1]
      index += 1
    }
    
    return result
    
  }
}
