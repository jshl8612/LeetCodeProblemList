//
//  s_58.swift
//  leetcode
//
//  Created by sykang on 2023/04/12.
//

import Foundation

struct s_58 {
  func lengthOfLastWord(_ s: String) -> Int {
    let cArr = Array(s)
    var count = 0
    for i in stride(from: s.count-1, through: 0, by: -1) {
      let char = cArr[i]
      if char.isLetter {
        count += 1
      } else if count > 0 {
        return count
      }
    }
    
    return count
  }
}
