//
//  s_27.swift
//  leetcode
//
//  Created by sykang on 2023/02/28.
//

//Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The relative order of the elements may be changed.
//
//Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array nums. More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result. It does not matter what you leave beyond the first k elements.
//
//Return k after placing the final result in the first k slots of nums.
//
//Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.
                                                                                                                                                                                
import Foundation

struct s_27 {
  func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var i = 0
    var k = 0
    let count = nums.count
    while i < count {
      
      if nums[i-k] == val {
        nums.remove(at: i-k)
        k+=1
      }
      i+=1
    }
    return nums.count
  }
}
