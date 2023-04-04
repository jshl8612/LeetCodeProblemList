//
//  AlgorithmsTests.swift
//  leetcode
//
//  Created by sykang on 2023/04/04.
//

import Foundation
import XCTest
@testable import leetcode

//typealias ListNode = leetcodeTests.ListNode

final class AlgorithmsTests: XCTestCase {
  func testS_36() {
    let s = s_36()
    
    var board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]].map({$0.map({Character($0)})})
    
    s.solveSudoku(&board)
    
    print(board)
  }
 
  func testS_32() {
    let s = s_32()
    
//    XCTAssertEqual(s.longestValidParentheses("()"), 2)
//    
//    XCTAssertEqual(s.longestValidParentheses("()(())"), 6)
    XCTAssertEqual(s.longestValidParentheses("(()))())("), 4)
  }
  
  func testS_40() {
    let s = s_40()
    
    XCTAssertEqual(s.combinationSum2([10,1,2,7,6,1,5], 8), [[1,1,6],[1,2,5],[1,7],[2,6]])
    
    let arr = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
    
    XCTAssertEqual(s.combinationSum2(arr, 30), [])
  }
}
