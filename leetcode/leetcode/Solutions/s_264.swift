//
//  s_264.swift
//  leetcode
//
//  Created by sykang on 2023/04/03.
//

import Foundation

class s_264 {
  private func isUgly(_ n: Int) -> Bool {
    if let v = memo[n] {
      return v
    }
    if n == 0 {
      return false
    }
    if n == 1 {
      return true
    }
    
    if n%2 == 0 {
      if isUgly(n/2) {
        memo[n] = true
        return true
      }
    }
    
    if n%3 == 0 {
      if isUgly(n/3) {
        memo[n] = true
        return true
      }
    }
    
    if n%5 == 0 {
      if isUgly(n/5) {
        memo[n] = true
        return true
      }
    }
    
    memo[n] = false
    
    return false
  }
  var memo: [Int: Bool] = [:]
  
  func nthUglyNumber(_ n: Int) -> Int {
    var dp = Array(repeating: 0, count: n)
    dp[0] = 1
    var index1 = 0, index2 = 0, index3 = 0
    
    for i in 1..<n {
      let num1 = dp[index1]*2
      let num2 = dp[index2]*3
      let num3 = dp[index3]*5
      
      let minNum = min(num1, num2, num3)
      dp[i] = minNum
      
      if minNum == num1 {
        index1 += 1
      }
      if minNum == num2 {
        index2 += 1
      }
      if minNum == num3 {
        index3 += 1
      }
    }
    
    return dp[n-1]
  }
}
