//
//  s_19.swift
//  leetcode
//
//  Created by sykang on 2023/02/16.
//

import Foundation

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  
  func toArray() -> [Int] {
    var result: [Int] = []
    var cur: ListNode? = self
    while cur != nil {
      result.append(cur!.val)
      cur = cur?.next
    }
    return result
  }
}

extension Array where Element == Int {
  public func toListNode() -> ListNode? {
    guard self.isEmpty == false else { return nil }
    var next: ListNode?
    self.reversed().forEach { num in
      let node = ListNode(num, next)
      next = node
    }
    return next
  }
}

struct s_19 {
  func removeNthFromEnd(_ nums: [Int], _ n: Int) -> ListNode? {
    guard let head = nums.toListNode() else { return nil }
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
