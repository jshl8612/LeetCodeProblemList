//
//  s_121.swift
//  leetcode
//
//  Created by sykang on 2023/03/30.
//

import Foundation

struct s_121 {
  func maxProfit(_ prices: [Int]) -> Int {
    
    var maxProfit = 0
    var i = 0
    for j in prices.indices where j > 0 {
      if prices[j] < prices[i] {
        i = j
        continue
      }
      let profit = prices[j] - prices[i]
      maxProfit = max(profit, maxProfit)
    }
    return maxProfit
  }
  
  func maxProfit2(_ prices: [Int]) -> Int {
    if prices.count < 2 { return 0 }
    
    var profit = 0
    
    for i in 1..<prices.count {
      guard prices[i] > prices[i - 1] else { continue }
      profit += prices[i] - prices[i - 1]
    }
    
    return profit
  }
  
  func maxProfit3(_ prices: [Int]) -> Int {
    var buy1 = Int.max
    var buy2 = Int.max
    var sell1 = 0
    var sell2 = 0
    
    for price in prices {
      buy1 = min(buy1, price)
      sell1 = max(sell1, price - buy1)
      
      buy2 = min(buy2, price - sell1)
      sell2 = max(sell2, price - buy2)
    }
    
    return sell2
  }
}
