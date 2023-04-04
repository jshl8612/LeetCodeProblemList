//
//  s_47.swift
//  leetcode
//
//  Created by sykang on 2023/04/04.
//

import Foundation

struct s_47 {
  func permuteUnique(_ nums: [Int]) -> [[Int]] {
    var result = Set<[Int]>()
    var path = [Int]()
    var visted = Array(repeating: false, count: nums.count)
    
    dfs(&result, &path, &visted, nums.sorted(), 0)
    
    return Array(result)
  }
  
  private func dfs(_ result: inout Set<[Int]>, _ path: inout [Int], _ visted: inout [Bool], _ nums: [Int], _ idx: Int) {
    if nums.isEmpty { return }
    
    if path.count == nums.count {
      result.insert(path)
    }
  
    for i in 0..<nums.count {
      if  visted[i] || i > 0 && nums[i] == nums[i-1] && visted[i-1] { continue }
      visted[i] = true
      path.append(nums[i])
      dfs(&result, &path, &visted, nums, i+1)
      path.removeLast()
      visted[i] = false
    }
  }
}
