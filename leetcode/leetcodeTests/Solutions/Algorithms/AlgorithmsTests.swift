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
  
}
