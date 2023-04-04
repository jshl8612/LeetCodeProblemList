//
//  s_312.swift
//  leetcode
//
//  Created by sykang on 2023/04/04.
//

import Foundation

struct s_312 {
  func maxCoins(_ nums: [Int]) -> Int {
    
    var nums = nums.filter({$0 != 0})
    nums = [1] + nums + [1]
    
    var dp = Array(repeating: Array(repeating: 0, count: nums.count), count: nums.count)
    
    
    
    return dp[0][nums.count-1]
  }
  
  private func dfs(nums: [Int], _ dp: inout [[Int]: Int]) -> Int {
    let key = nums
    if let v = dp[key] {
      return v
    }
    
    if nums.count == 1 {
      return nums[0]
    }
    
    if nums.count == 2 {
      return max(nums[0], nums[1]) + (nums[0] * nums[1])
    }
    
    var maxValue = 0
    for i in 0..<nums.count {
      if i == 0 {
        maxValue = max((nums[0] * nums[1]) + dfs(nums: Array(nums[1...]), &dp), maxValue)
      } else if i == nums.count - 1 {
        maxValue = max((nums[i] * nums[i-1]) + dfs(nums: Array(nums[0..<i]), &dp), maxValue)
      } else {
        maxValue = max((nums[i] * nums[i-1] * nums[i+1]) + dfs(nums: Array(nums[0..<i]) + Array(nums[(i+1)...]), &dp), maxValue)
      }
    }
    
    dp[key] = maxValue
    
    return maxValue
  }
}
