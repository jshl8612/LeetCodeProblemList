//
//  solutionTests_1.swift
//  leetcodeTests
//
//  Created by sykang on 2023/02/15.
//

import Foundation
import XCTest
@testable import leetcode

//typealias ListNode = leetcodeTests.ListNode

final class solutionTests_1: XCTestCase {

  func testS_8() {
    let s = s_8()
    
//    XCTAssertEqual(s.myAtoi("    -42"), -42)
//    XCTAssertEqual(s.myAtoi("words and 987"), 0)
    XCTAssertEqual(s.myAtoi("  +  413"), 0)
  }
  
  func testS_10() {
    let s = s_10()
    
    XCTAssertEqual(s.isMatch("aa", "a"), false)
    XCTAssertEqual(s.isMatch("aa", "a*"), true)
    XCTAssertEqual(s.isMatch("ab", ".*"), true)
  }
  
  func testS_12() {
    let s = s_12()
    
    XCTAssertEqual(s.intToRoman(3), "III")
    XCTAssertEqual(s.intToRoman(58), "LVIII")
    XCTAssertEqual(s.intToRoman(1994), "MCMXCIV")
  }
  
  func testS_15() {
    let s = s_15()
    
    XCTAssertEqual(s.threeSum([-1,0,1,2,-1,-4]), [[-1,-1,2],[-1,0,1]])
  }

  func testS_17() {
    let s = s_17()
    
    XCTAssertEqual(s.letterCombinations("23"), ["ad","ae","af","bd","be","bf","cd","ce","cf"])
  }
  
  func testS_19() {
    let s = s_19()
    
    XCTAssertEqual(s.removeNthFromEnd([1,2,3,4,5,6], 2)?.toArray(), [1,2,3,5,6])
  }
  
  func testS_22() {
    let s = s_22()
    
    XCTAssertEqual(s.generateParenthesis(3).count, 5)
  }
  
  func testS_23() {
    let s = s_23()
    
    XCTAssertEqual(s.mergeKLists([[1,4,5],[1,3,4],[2,6]]), [1,1,2,3,4,4,5,6])
    XCTAssertEqual(s.mergeKLists([[]]), [])
    XCTAssertEqual(s.mergeKLists([]), [])
  }
  
  func testS_25() {
    let s = s_25()
    
//    XCTAssertEqual(s.reverse([1,2,3], 3), [3,2,1])
//    XCTAssertEqual(s.reverse([1,2,3], 2), [2,1,3])
//    XCTAssertEqual(s.reverse([1,2,3,4,5,6,7], 8), [1,2,3,4,5,6,7])
    
    XCTAssertEqual(s.reverseKGroup([1,2,3,4,5,6], 3), [3,2,1,6,5,4])
    XCTAssertEqual(s.reverseKGroup([1,2,3,4,5,6], 2), [2,1,4,3,6,5])
    XCTAssertEqual(s.reverseKGroup([1,2,3,4,5,6,7], 3), [3,2,1,6,5,4,7])
  }
  
  func testS_27() {
    let s = s_27()
    
//    var arr1 = [3,2,2,3]
//    XCTAssertEqual(s.removeElement(&arr1, 3), 2)
//    XCTAssertEqual(arr1, [2,2])
    
    var arr2 = [0,1,2,2,3,0,4,2]
    XCTAssertEqual(s.removeElement(&arr2, 2), 5)
    XCTAssertEqual(arr2, [0,1,3,0,4])
  }
  
  func testS_28() {
    let s = s_28()
    
    XCTAssertEqual(s.strStr2("hello", "ll"), 2)
  }
  
  func testS_44() {
    let s = s_44()
    
    XCTAssertEqual(s.isMatch("aa", "*"), true)
  }

  func testS_64() {
    let s = s_64()
    
    XCTAssertEqual(s.minPathSum([[1,2,3],[4,5,6]]), 12)
    XCTAssertEqual(s.minPathSum([[1,3,1],[1,5,1],[4,2,1]]), 7)
  }
  
  func testS_72() {
    let s = s_72()
    
    XCTAssertEqual(s.minDistance("horse", "ros"), 3)
  }
  
  func testS_85() {
    let s = s_85()
    
    XCTAssertEqual(s.maximalRectangle([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]), 6)
    
    XCTAssertEqual(s.maximalRectangle([["0","1"],["1","0"]]), 1)
//    XCTAssertEqual(s.maximalRectangle([["1","1","1","1","0"],["0","0","0","0","0"],["0","0","1","1","1"]]), 4)
  }
  
  func testS_87() {
    let s = s_87()
    
    XCTAssertEqual(s.isScramble("great", "rgeat"), true)
    
    XCTAssertEqual(s.isScramble("abcde", "caebd"), false)
    
    XCTAssertEqual(s.isScramble("great", "taerg"), true)
  }
  
  func testS_97() {
    let s = s_97()
    
    XCTAssertEqual(s.isInterleave("aab", "aad", "aadaab"), true)
  }
}
