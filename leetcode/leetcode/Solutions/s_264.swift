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
  
  func nthUglyNumber(_ n: Int, _ a: Int, _ b: Int, _ c: Int) -> Int {
    var l = 1, r = Int.max
    while l < r {
      let mid = l + (r-l)/2
      let index = indexOfUglyNum(mid, a, b, c)
      if index < n {
        l = mid + 1
      } else {
        r = mid
      }
    }
  
    return l
  }
  
  private func indexOfUglyNum(_ n: Int, _ a: Int, _ b: Int, _ c: Int) -> Int {
    return n/a + n/b + n/c - n/lcm(a, b) - n/lcm(b, c) - n/lcm(a, c) + n/lcm(a, lcm(b, c))
  }
  
  private func lcm(_ a: Int, _ b: Int) -> Int {
    let gcd = gcd(a, b)
    return (a/gcd)*b
  }
  
  private func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    if a/b == 0 {
      return gcd(b, a)
    }
    return gcd(a%b, b)
  }
}
