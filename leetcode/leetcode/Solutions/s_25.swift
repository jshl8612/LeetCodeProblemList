//
//  s_25.swift
//  leetcode
//
//  Created by sykang on 2023/02/27.
//

import Foundation

struct s_25 {
  
  func reverseKGroup(_ nums: [Int], _ k: Int) -> [Int] {
    return reverseKGroup(ListNode(nums), k)?.toArray() ?? []
  }
  func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head?.next == nil || k == 1 {
      return head
    }
    
    let dummy = ListNode(-1)
    
    var cur: ListNode? = head
    var pre: ListNode? = dummy
    while cur != nil {
      let curHead = reverse(cur, k)
      pre?.next = curHead
      pre = cur
      cur = cur?.next
    }
    
    return dummy.next
  }
  
  //head: head of a list
  //return: new head of list
  func reverse(_ nums: [Int], _ k: Int) -> [Int] {
    return reverse(ListNode(nums), k)?.toArray() ?? []
  }
  private func reverse(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head?.next == nil || k == 1 {
      return head
    }
    
    let cur: ListNode? = head
    var next: ListNode? = head?.next
    var curHead: ListNode? = head
    for i in 1..<k {
      next = cur?.next
      
      if next == nil {
        return reverse(curHead, i)
      }
      
      cur?.next = next?.next
      next?.next = curHead
      curHead = next
      
      print("----------")
      print("i: \(i)")
      print("cur: \(cur?.description ?? "")")
      print("next: \(next?.description ?? "")")
      print("curHead: \(curHead?.description ?? "")")
    }
    
    print("----------")
    print("return \(curHead?.description ?? "")")
    return curHead
  }
}
