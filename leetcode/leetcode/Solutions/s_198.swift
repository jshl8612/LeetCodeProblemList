//
//  s_198.swift
//  leetcode
//
//  Created by sykang on 2023/04/03.
//

import Foundation

struct s_198 {
  func rob(_ nums: [Int]) -> Int {
    if nums.count == 1 { return nums[0] }
    if nums.count == 2 { return max(nums[0], nums[1]) }
    
    var dp: [Int] = Array(repeating: 0, count: nums.count)
    dp[0] = nums[0]
    dp[1] = max(dp[0], nums[1])
    
    for index in 2..<nums.count {
      dp[index] = max(dp[index - 1], dp[index - 2] + nums[index])
    }
    
    return dp[nums.count - 1]
  }
  
  func rob2(_ nums: [Int]) -> Int {
    var max1 = 0, max2 = 0
    var max3 = 0, max4 = 0
    
    for (i, num) in nums.enumerated() {
      if i == 0 {
        let temp = max1
        max1 = max(max1, num + max2)
        max2 = temp
      } else if i == nums.count-1 {
        let temp = max3
        max3 = max(max3, num + max4)
        max4 = temp
      } else {
        let temp1 = max1
        max1 = max(max1, num + max2)
        max2 = temp1
        
        let temp2 = max3
        max3 = max(max3, num + max4)
        max4 = temp2
      }
    }
    
    return max(max1, max2, max3, max4)
  }
}
