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
  
  func testS_47() {
    let s = s_47()
    
    
    XCTAssertEqual(s.permute([1,2,3]), [])
    
//    XCTAssertEqual(s.permuteUnique( [1,1,2]), [[1,1,2],
//                                               [1,2,1],
//                                               [2,1,1]])
//    
//    let arr = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
//    XCTAssertEqual(s.permuteUnique(arr), [])
  }
  
  func testS_48() {
    let s = s_48()
    var matrix1 = [[1,2,3],[4,5,6],[7,8,9]]
    s.rotate(&matrix1)
    XCTAssertEqual(matrix1, [[7,4,1],[8,5,2],[9,6,3]])
    
    var matrix2 = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
    s.rotate(&matrix2)
    XCTAssertEqual(matrix2, [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]])
  }
  
  func testS_50() {
    let s = s_50()
    
    XCTAssertEqual(s.myPow(2.0, -2147483648), 0)
  }
}
