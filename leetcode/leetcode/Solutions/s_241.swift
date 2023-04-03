//
//  s_241\.swift
//  leetcode
//
//  Created by sykang on 2023/04/03.
//

import Foundation

class s_241 {
  
  private func operation(c: Character) -> ((Int, Int) -> Int)? {
    switch c {
    case "+":
      return {l, r in l+r}
    case "-":
      return {l, r in l-r}
    case "*":
      return {l, r in l*r}
    default:
      return nil
    }
  }
  
  var memo: [String: [Int]]  = [:]
  func diffWaysToCompute(_ expression: String) -> [Int] {
    if let v = memo[expression] {
      return v
    }
    if let num = Int(expression) {
      return [num]
    }
    
    var nums: [Int] = []
    
    for (i, c) in Array(expression).enumerated() {
      if let op = operation(c: c) {
        let leftNums = diffWaysToCompute(String(Array(expression)[0..<i]))
        let rightNums = diffWaysToCompute(String(Array(expression)[(i+1)...]))
        
        for l in leftNums {
          for r in rightNums {
            nums.append(op(l,r))
          }
        }
      }
    }
    
    memo[expression] = nums
    return nums
  }
}
