//
//  s_124.swift
//  leetcode
//
//  Created by sykang on 2023/03/31.
//

import Foundation

struct s_124 {
  func maxPathSum(_ root: TreeNode?) -> Int {
    guard let root else { return 0 }
    var curMax = Int.min
    return maxSum(root, &curMax)
  }
  
  private func maxSum(_ node: TreeNode?, _ curMax: inout Int) -> Int {
    guard let node else { return 0 }
    
    let leftSum = max(maxSum(node.left, &curMax), 0)
    let rightSum = max(maxSum(node.right, &curMax), 0)
    
    curMax = max((leftSum + rightSum + node.val), curMax)
    
    return max(leftSum, rightSum) + node.val
  }
}
