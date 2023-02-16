//
//  s_12.swift
//  leetcode
//
//  Created by sykang on 2023/02/16.
//

import Foundation

//Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
//
//Symbol       Value
//I             1
//V             5
//X             10
//L             50
//C             100
//D             500
//M             1000
//For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.
//
//Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
//
//I can be placed before V (5) and X (10) to make 4 and 9.
//X can be placed before L (50) and C (100) to make 40 and 90.
//C can be placed before D (500) and M (1000) to make 400 and 900.
//Given an integer, convert it to a roman numeral.

struct s_12 {
  func intToRoman(_ num: Int) -> String {
    enum Roman: Int, CaseIterable {
      case M  = 1000
      case CM = 900
      case D = 500
      case CD = 400
      case C = 100
      case XC = 90
      case L = 50
      case XL = 40
      case X = 10
      case IX = 9
      case V = 5
      case IV = 4
      case I = 1
      
      var char: String {
        switch self {
        case .M:
          return "M"
        case .CM:
          return "CM"
        case .D:
          return "D"
        case .CD:
          return "CD"
        case .C:
          return "C"
        case .XC:
          return "XC"
        case .L:
          return "L"
        case .XL:
          return "XL"
        case .X:
          return "X"
        case .IX:
          return "IX"
        case .V:
          return "V"
        case .IV:
          return "IV"
        case .I:
          return "I"
        }
      }
    }
    
    var num = num
    var result = ""
    var romans = Roman.allCases
    while num > 0 {
      for (i, roman) in romans.enumerated() {
        if num >= roman.rawValue {
          num -= roman.rawValue
          result.append(roman.char)
          if i > 0 {
            romans.removeFirst(i)
          }
          break
        }
      }
    }
    
    return result
  }
}
