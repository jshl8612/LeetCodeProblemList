//
//  s_10.swift
//  leetcode
//
//  Created by sykang on 2023/02/15.
//

import Foundation

//Given an input string s and a pattern p, implement regular expression matching with support for '.' and '*' where:
//
//'.' Matches any single character.
//'*' Matches zero or more of the preceding element.
//The matching should cover the entire input string (not partial).

//https://leetcode.com/problems/regular-expression-matching/solutions/3109203/easily-understandable-solution-beats-99-30/
struct s_10 {
  func isMatch(_ s: String, _ p: String) -> Bool {
    let m = s.count, n = p.count
    let s = Array(s), p = Array(p)
    var dp = Array(repeating: Array(repeating: false, count: n+1), count: m+1)
    dp[0][0] = true
    
    for i in 0...m {
      for j in 1...n {
        if p[j - 1] == "*" {
          dp[i][j] = dp[i][j - 2] || (i != 0 && dp[i - 1][j] && (s[i - 1] == p[j - 2] || p[j - 2] == "."))
        } else {
          dp[i][j] = i != 0 && dp[i - 1][j - 1] && (s[i - 1] == p[j - 1] || p[j - 1] == ".")
        }
      }
    }
    return dp[m][n]
  }
}
