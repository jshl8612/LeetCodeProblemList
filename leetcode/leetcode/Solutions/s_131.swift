//
//  s_131.swift
//  leetcode
//
//  Created by sykang on 2023/03/31.
//

import Foundation

struct s_131 {
  func partition(_ s: String) -> [[String]] {
    let n = s.count
    let c = Array(s)
    var dp = Array(repeating: Array(repeating: false, count: n), count: n)
    
    var result: [[String]] = []
    var curList: [String] = []
    
    
    dfs(start: 0, n: n, c: c, dp: &dp, curList: &curList, result: &result)

    return result
  }
  
  private func dfs(start: Int, n: Int, c: [Character], dp: inout [[Bool]],  curList: inout [String], result: inout [[String]]) {
    guard start < n else {
      result.append(curList)
      return
    }
    for end in start..<n {
      if c[start] == c[end] && (end - start < 2 || dp[start+1][end-1]) {
        curList.append(String(c[start...end]))
        dp[start][end] = true
        
        dfs(start: end+1, n: n, c: c, dp: &dp, curList: &curList, result: &result)
        curList.removeLast()
      }
    }
  }
  
  func minCut(_ s: String) -> Int {

    
    let n = s.count
    let c = Array(s)
    var dp = Array(repeating: Array(repeating: false, count: n), count: n)
    
    
    for start in (0..<n) {
      for end in (start..<n) {
        if c[start] == c[end] && (end - start < 2 || dp[start+1][end-1]) {
          dp[start][end] = true
          print(String(c[start...end]))
        }
      }
    }
    print(dp)
    
    var dp1: [Int] = Array(repeating: Int.max, count: n+1)
    dp1[0] = -1
    for end in (1...n) {
      for start in (0..<end) {
        if dp[start][end-1] {
          dp1[end] = min(dp1[start] + 1, dp1[end])
          print("\(start), \(end), \(dp1[end]), \(dp1[start] + 1)")
        }
      }
    }
  
    print("dp1: \(dp1)")
    return dp1[n]
  }
  
  private func dfsMinCut(start: Int, n: Int, c: [Character], dp: inout [[Bool]]) -> Int {
    var cut = 0
    
    for end in start..<n {
      if c[start] == c[end] && (end - start < 2 || dp[start+1][end-1]) {
        dp[start][end] = true
        cut = dfsMinCut(start: end+1, n: n, c: c, dp: &dp) + 1
      }
    }
    
    return cut
  }
}
