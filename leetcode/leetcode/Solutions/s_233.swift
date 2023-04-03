//
//  s_233.swift
//  leetcode
//
//  Created by sykang on 2023/04/03.
//

import Foundation

struct s_233 {
  func countDigitOne(_ n: Int) -> Int {
    let len = String(n).count
    if len == 1 {
      if n == 0 {
        return 0
      }
      return 1
    }
    
    var ans = 0
    for i in 0...len {
      let p = Int(powf(10, Float(i)))
      let prefix = n/(p*10)
      let digit = (n/p)%10
      let suffix = n%p
      
      switch digit {
      case 0:
        ans += prefix*p
      case 1:
        ans += prefix*p + suffix + 1
      default:
        ans += (prefix+1)*p
      }
    }
    
    
    return ans
  }
}
