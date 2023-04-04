//
//  s_32.swift
//  leetcode
//
//  Created by sykang on 2023/04/04.
//

import Foundation

struct s_32 {
  func longestValidParentheses(_ s: String) -> Int {
    var stack: [Character] = []
    let arr = Array(s)
    for i in 0..<arr.count {
      if stack.isEmpty {
        stack.append(arr[i])
        continue
      }
      
      if arr[i] == ")" {
      loop:
        for j in stride(from: stack.count-1, through: 0, by: -1) {
        
          if stack[j] == "1" {
            if j == 0 {
              stack.append(arr[i])
            }
            continue
          }
          
          if stack[j] == "(" {
            stack.remove(at: j)
            stack.append("1")
            break loop
          }
          
          stack.append(arr[i])
          break loop
        }
      } else {
        stack.append(arr[i])
      }
      
      print(stack)
    }
    
    var ans = 0
    var temp = 0
    for c in stack {
      switch c {
      case "1":
        temp += 1
        ans = max(temp, ans)
      default:
        temp = 0
      }
    }
    
    return ans*2
  }
  
  private func isValid(arr: [Character]) {
    
  }
}
