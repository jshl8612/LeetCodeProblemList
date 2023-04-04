//
//  s_40.swift
//  leetcode
//
//  Created by sykang on 2023/04/04.
//

import Foundation

struct s_40 {
  func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var path: [Int] = []
    var result = Set<[Int]>()
    
    dfs(&path, &result, candidates.sorted(), target, 0)
    
    return Array(result)
  }
  
  private func dfs(_ path: inout [Int], _ result: inout Set<[Int]>, _ candidates: [Int], _ target: Int, _ idx: Int) {
    for i in idx..<candidates.count where candidates[i] <= target {
      if i > 0 && candidates[i] == candidates[i-1] && i != idx { continue }
      if candidates[i] == target {
        result.insert(path+[target])
      } else {
        path.append(candidates[i])
        dfs(&path, &result, candidates, target - candidates[i], i+1)
        path.removeLast()
      }
    }
  }
  
  
  private func helper(_ candidates: [Int], _ target: Int) -> Set<[Int]>?  {
    let candidates = candidates.filter({$0 <= target})
    var result = Set<[Int]>()
    
    for i in candidates.indices {
      if i == candidates.count-1 {
        if candidates[i] == target {
          result.insert([target])
        }
        return result
      }
      
      if let subResult = helper(Array(candidates[(i+1)...]), target - candidates[i]) {
        for sub in subResult.map({[candidates[i]] + $0}) {
          result.insert(sub)
        }
      }
    }
    
    return result.isEmpty ? nil : result
  }
}
