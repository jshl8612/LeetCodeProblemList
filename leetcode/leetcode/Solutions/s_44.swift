//
//  s_44.swift
//  leetcode
//
//  Created by sykang on 2023/03/29.
//

import Foundation

struct s_44 {
  func isMatch(_ s: String, _ p: String) -> Bool {
    let sArr = Array(s)
    let pArr = Array(p)
    
    var dp = Array(repeating: Array(repeating: false, count: p.count+1), count: s.count+1)
    dp[0][0] = true
    
    for i in 0...sArr.count {
      for j in 0...pArr.count where j > 1 {
        let cp = pArr[j-1]
        
        if cp != "*" {
          dp[i][j] = i > 0 && dp[i-1][j-1] && (cp == sArr[i-1] || cp == "?")
        } else {
          if j == 1 {
            dp[i][j] = true
          } else {
            dp[i][j] = (0...i).contains(where: { dp[$0][j-1] })
          }
        }
      }
    }
    
    return dp[sArr.count][pArr.count]
  }
}
