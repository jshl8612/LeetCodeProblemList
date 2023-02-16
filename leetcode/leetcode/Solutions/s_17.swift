//
//  s_17.swift
//  leetcode
//
//  Created by sykang on 2023/02/16.
//

import Foundation

//Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.
//
//A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

//Example 1:
//
//Input: digits = "23"
//Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
//Example 2:
//
//Input: digits = ""
//Output: []
//Example 3:
//
//Input: digits = "2"
//Output: ["a","b","c"]

struct s_17 {
  func letterCombinations(_ digits: String) -> [String] {
    let nums: [Int: [String]] = [2: ["a", "b", "c"],
                                 3: ["d", "e", "f"],
                                 4: ["g", "h", "i"],
                                 5: ["j", "k", "l"],
                                 6: ["m", "n", "o"],
                                 7: ["p", "q", "r", "s"],
                                 8: ["t", "u", "v"],
                                 9: ["w", "x", "y", "z"]]
    
    var digits = Array(digits.reversed())
    var results: [String] = []
    while digits.isEmpty == false {
      let c = digits.removeFirst()
      
      if let num = Int(String(c)), let cArr = nums[num] {
        if results.isEmpty {
          results = cArr
        } else {
          results = cArr.map({ c in
            results.map({c+$0})
          }).flatMap({$0})
        }
      } else {
        return []
      }
    }
    
    return results
  }
}
