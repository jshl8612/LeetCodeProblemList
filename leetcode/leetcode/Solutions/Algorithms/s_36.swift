//
//  s_36.swift
//  leetcode
//
//  Created by sykang on 2023/04/04.
//

import Foundation

struct s_36 {
  func isValidSudoku(_ board: [[Character]]) -> Bool {
    var rowSets = Array(repeating: Set<Int>(), count: 9)
    var colSets = Array(repeating: Set<Int>(), count: 9)
    var boxSets = Array(repeating: Set<Int>(), count: 9)
    for i in board.indices {
      for j in board[0].indices {
        if let num = Int(String(board[i][j])) {
          if rowSets[i].contains(num) {
            return false
          }
          rowSets[i].insert(num)
          
          if colSets[j].contains(num) {
            return false
          }
          colSets[j].insert(num)
          
          let boxIndex = (j/3)*3 + (i/3)
          
          if boxSets[boxIndex].contains(num) {
            return false
          }
          boxSets[boxIndex].insert(num)
        }
      }
    }
    return true
  }
  
  func solveSudoku(_ board: inout [[Character]]) {
    if solveHelper(&board) {
      print("succeed")
    } else {
      print("failed")
    }
  }
  
  @discardableResult
  private func solveHelper(_ board: inout [[Character]]) -> Bool {
    for r in board.indices {
      for c in board[0].indices where board[r][c] == "." {
        for char in 1...9 where isValid(char: Character("\(char)"), at: (r, c), &board) {
          board[r][c] = Character("\(char)")
          if solveHelper(&board) {
            return true
          } else {
            board[r][c] = Character(".")
          }
        }
        return false
      }
    }
    return true
  }
  
  private func isValid(char: Character, at path: (r: Int, c: Int),  _ board: inout [[Character]]) -> Bool {
    for i in 0...8 {
      if board[path.r][i] == char {
        return false
      }
      if board[i][path.c] == char {
        return false
      }
      
      let r = (path.r/3)*3 + (i/3)
      let c = (path.c/3)*3 + (i%3)
      
      if board[r][c] == char {
       return false
      }
    }
    
    return true
  }
}
