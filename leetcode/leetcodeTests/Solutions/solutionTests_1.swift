//
//  solutionTests_1.swift
//  leetcodeTests
//
//  Created by sykang on 2023/02/15.
//

import XCTest
@testable import leetcode

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
}
