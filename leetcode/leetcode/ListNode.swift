//
//  ListNode.swift
//  leetcode
//
//  Created by sykang on 2023/02/27.
//
import Foundation

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  
  init?(_ nums: [Int]) {
    var next: ListNode?
    nums.reversed().forEach { num in
      let node = ListNode(num, next)
      next = node
    }
    if let head = next {
      self.val = head.val
      self.next = head.next
    } else {
      return nil
    }
  }
  
  func toArray() -> [Int] {
    var result: [Int] = []
    var cur: ListNode? = self
    while cur != nil {
      result.append(cur!.val)
      cur = cur?.next
    }
    return result
  }
  
  var description: String {
    return "(val: \(val), next val: \(next?.val ?? -1))"
  }
}
