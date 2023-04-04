//
//  s_300.swift
//  leetcode
//
//  Created by sykang on 2023/04/04.
//

import Foundation

struct s_300 {
  func lengthOfLIS(_ nums: [Int]) -> Int {
    var dp = Array(repeating: 1, count: nums.count)
    var ans = 1
    for i in 1..<nums.count {
      for j in 0..<i {
        if nums[i] > nums[j] {
          dp[i] = max(dp[i], dp[j] + 1)
        }
      }
      
      ans = max(ans, dp[i])
    }
    return ans
  }
}
