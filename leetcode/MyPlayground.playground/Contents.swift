import UIKit


public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  
  public init?(_ nums: [Int]) {
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
  
  public func toArray() -> [Int] {
    var result: [Int] = []
    var cur: ListNode? = self
    while cur != nil {
      result.append(cur!.val)
      cur = cur?.next
    }
    return result
  }
}


var greeting = "Hello, playground"

func reverse(_ nums: [Int], _ k: Int) -> [Int] {
  return reverse(ListNode(nums), k)?.toArray() ?? []
}
private func reverse(_ head: ListNode?, _ k: Int) -> ListNode? {
  if head?.next == nil || k == 1 {
    return head
  }
  
  var cur: ListNode? = head
  var next: ListNode? = head?.next
  var curHead: ListNode? = head
  for i in 1..<k {
    next = cur?.next
    if next == nil {
      return reverse(curHead, i)
    }
    cur?.next = curHead
    curHead = cur
    cur = next
  }
  
  return curHead
}


print(reverse([1,2,3], 3))
