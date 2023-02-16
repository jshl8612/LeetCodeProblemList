//
//  s_15.swift
//  leetcode
//
//  Created by sykang on 2023/02/16.
//

import Foundation

//Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
//
//Notice that the solution set must not contain duplicate triplets.
//
//
//
//Example 1:
//
//Input: nums = [-1,0,1,2,-1,-4]
//Output: [[-1,-1,2],[-1,0,1]]
//Explanation:
//nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
//nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
//nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
//The distinct triplets are [-1,0,1] and [-1,-1,2].
//Notice that the order of the output and the order of the triplets does not matter.
//Example 2:
//
//Input: nums = [0,1,1]
//Output: []
//Explanation: The only possible triplet does not sum up to 0.
//Example 3:
//
//Input: nums = [0,0,0]
//Output: [[0,0,0]]
//Explanation: The only possible triplet sums up to 0.
//
//
//Constraints:
//
//3 <= nums.length <= 3000
//-105 <= nums[i] <= 105

struct s_15 {
  func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 2 else { return [] }
    var results: [[Int]] = []
    let sorted = nums.sorted()
    var i = 0
    
    while i < sorted.count-2 {
      if i > 0, sorted[i] == sorted[i-1] {
        i += 1
        continue
      }
      
      var j = i+1
      var k = sorted.count-1
      
      while j < k {
        let sum = sorted[i] + sorted[j] + sorted[k]
        if sum == 0 {
          if j-1 > i, sorted[j] == sorted[j-1] {
            j+=1
            continue
          }
          
          results.append([sorted[i], sorted[j], sorted[k]])
          j+=1
        } else if sum < 0 {
          j+=1
        } else {
          k-=1
        }
      }
      i+=1
    }
    
    return results
  }
}
