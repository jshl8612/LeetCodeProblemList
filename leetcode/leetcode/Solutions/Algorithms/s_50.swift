//
//  s_50 .swift
//  leetcode
//
//  Created by sykang on 2023/04/04.
//

import Foundation

struct s_50 {
  func myPow(_ x: Double, _ n: Int) -> Double {
    guard n != 0 else { return 1 }
    guard x != 1 else { return 1 }
    guard x != 0 else { return 0 }
    
    var x = x
    var n = n
    if n < 0 {
      n = -n
      x = 1/x
    }
    
    return n%2 == 0 ? myPow(x*x, n/2) : x*myPow(x*x, n/2)
  }
  
  private func pow(_ x: Double, _ n: Int, _ dp: inout [Int: Double], _ isPos: Bool) -> Double {
    if let v = dp[n] { return v }
    if n == 0 { return 1 }
    if n == 1 {
      if isPos {
        return x
      } else {
        return 1.0/x
      }
    }
    
    let result = pow(x, n/2, &dp, isPos) * pow(x, n-(n/2), &dp, isPos)
    if result.isNaN {
      return result
    }
    dp[n] = result
    return result
  }
}
