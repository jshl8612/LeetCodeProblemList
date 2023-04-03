//
//  s_152.swift
//  leetcode
//
//  Created by sykang on 2023/04/03.
//

import Foundation

struct s_152 {
  func maxProduct(_ nums: [Int]) -> Int {
    let n = nums.count
    var dp: [[Int?]] = Array(repeating: Array(repeating: nil, count: n), count: n)
    var maxValue = Int.min
    for i in 0..<n {
      dp[i][i] = nums[i]
      maxValue = max(nums[i], maxValue)
      loop:
      for j in i..<n where j > i {
        let nextNum = nums[j]
        if nextNum == 0 {
          dp[i][j] = 0
          maxValue = max(0, maxValue)
          break loop
        }
        if let v = dp[i][j-1] {
          dp[i][j] = v * nextNum
        } else {
          dp[i][j] = nextNum
        }
        
        maxValue = max(dp[i][j]!, maxValue)
      }
    }
    
    return maxValue
  }
  
  func maxProduct1(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    
    var ans = nums[0]
    var maxSoFar = nums[0]
    var minSoFar = nums[0]
    
    for i in 1..<nums.count {
      let curr = nums[i]
      
      let tmpMax = max(curr, maxSoFar * curr, minSoFar * curr)
      minSoFar = min(curr, maxSoFar * curr, minSoFar * curr)
      maxSoFar = tmpMax
      
      ans = max(ans, maxSoFar)
    }
    
    return ans
  }
}
