//
//  s_41.swift
//  leetcode
//
//  Created by sykang on 2023/04/04.
//

import Foundation

struct s_41 {
  func firstMissingPositive(_ nums: [Int]) -> Int {
    var missing: [Int] = Array(repeating: 0, count: nums.count)
    for n in nums where n <= nums.count && n > 0 {
      missing[n-1] = 1
    }
    
    if let index = missing.firstIndex(of: 0) {
      return index+1
    }
    return nums.count+1
  }
}
