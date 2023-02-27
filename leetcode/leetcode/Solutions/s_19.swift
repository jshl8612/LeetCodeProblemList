//
//  s_19.swift
//  leetcode
//
//  Created by sykang on 2023/02/16.
//

import Foundation

struct s_19 {
  func removeNthFromEnd(_ nums: [Int], _ n: Int) -> ListNode? {
    guard nums.isEmpty == false else { return nil }
    var next: ListNode?
    nums.reversed().forEach { num in
      let node = ListNode(num, next)
      next = node
    }
    guard let head = next else { return nil }
    guard n > 0 else { return head }
    
    var cur: ListNode? = head
    var temp: [ListNode] = []
    while cur != nil {
      temp.insert(cur!, at: 0)
      if temp.count > n+1 {
        temp.removeLast()
      }
      cur = cur?.next
    }
    
    if temp.count <= n {
      return nil
    } else if n == 1 {
      temp[1].next = nil
    } else {
      temp[n].next = temp[n-2]
    }
    
    return head
  }
}
