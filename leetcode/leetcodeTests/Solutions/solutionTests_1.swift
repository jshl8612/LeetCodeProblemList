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

}
