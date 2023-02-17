//
//  s_22.swift
//  leetcode
//
//  Created by sykang on 2023/02/17.
//

import Foundation
//Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
//
//
//
//Example 1:
//
//Input: n = 3
//Output: ["((()))","(()())","(())()","()(())","()()()"]
//Example 2:
//
//Input: n = 1
//Output: ["()"]

struct s_22 {
  func generateParenthesis(_ n: Int) -> [String] {
          var array:[String] = []
          recurrsion (array: &array, str: "", n: n, m: 0 )
          return array
          
      }
      
      func recurrsion(array : inout [String],  str: String , n: Int, m: Int) {
      
          if n == 0 && m == 0 {
              array.append(str)
              return
          }
          if m > 0 {
              recurrsion(array: &array,  str: str + ")", n: n, m: m - 1)
          }
          
          if n > 0 {
              recurrsion (array: &array, str: str + "(", n: n-1, m: m + 1)
          }
      }
  
  func generateParenthesis2(_ n: Int) -> [String] {
    var resultSet = Set(["()"])
    var n = n
    while n > 1 {
      
      var newSet = Set<String>()
      
      resultSet.forEach { text in
        
        let cArr = Array(text)
        var indexes = Set<Int>()
        for (i, _) in cArr.enumerated() {
          indexes.insert(i)
          indexes.insert(i+1)
        }
        
        for index in indexes {
          var newText = Array(text)
          newText.insert(contentsOf: ["(", ")"], at: index)
          newSet.insert(String(newText))
        }
      }
      
      resultSet = newSet
      n -= 1
    }
    
    return Array(resultSet)
  }
}
