//
//  s_23.swift
//  leetcode
//
//  Created by sykang on 2023/02/20.
//

import Foundation

//You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.
//
//Merge all the linked-lists into one sorted linked-list and return it.
//
//Example 1:
//
//Input: lists = [[1,4,5],[1,3,4],[2,6]]
//Output: [1,1,2,3,4,4,5,6]
//Explanation: The linked-lists are:
//[
//  1->4->5,
//  1->3->4,
//  2->6
//]
//merging them into one sorted list:
//1->1->2->3->4->4->5->6
//Example 2:
//
//Input: lists = []
//Output: []
//Example 3:
//
//Input: lists = [[]]
//Output: []


struct s_23 {
  
  func mergeKLists(_ arr: [[Int]]) -> [Int] {
    let nodeList = arr.compactMap({ListNode($0)})
    return mergeKLists(nodeList)?.toArray() ?? []
  }
  
  func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    guard lists.isEmpty == false else { return nil }
    var lists = lists
    var interval = 1
    
    while interval < lists.count {
      var i = 0
      while i + interval < lists.count {
        lists[i] = mergeList(lists[i], lists[i+interval])
        i += interval*2
      }
      
      interval *= 2
    }
    
    return lists[0]
  }
  
  private func mergeList(_ a: ListNode?, _ b: ListNode?) -> ListNode? {
    let dummy = ListNode(-1)
    var cur: ListNode? = dummy
    var a = a
    var b = b
    
    while a != nil || b != nil {
      if let aVal = a?.val, let bVal = b?.val {
        if aVal > bVal {
          cur?.next = b
          b = b?.next
        } else {
          cur?.next = a
          a = a?.next
        }
      } else if a != nil {
        cur?.next = a
        a = nil
      } else if b != nil {
        cur?.next = b
        b = nil
      }
      cur = cur?.next
    }
    
    return dummy.next
  }
}

