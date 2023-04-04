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
  
  func maxProfit4(_ k: Int, _ prices: [Int]) -> Int {
    var buyDp = Array(repeating: Int.max, count: k)
    var sellDp = Array(repeating: 0, count: k)
    
    for price in prices {
      for j in 0..<k {
        if j == 0 {
          buyDp[j] = min(buyDp[j], price)
        } else {
          buyDp[j] = min(buyDp[j], price - sellDp[j-1])
        }
        sellDp[j] = max(sellDp[j], price - buyDp[j])
      }
    }
    
    return sellDp[k-1]
  }
  
  
  func maxProfit5(_ prices: [Int]) -> Int {
    let cnt = prices.count
    guard cnt > 1 else { return 0 }
    
    var value = 0
    var dp = [Int](repeating: 0, count: cnt)
    
    for i in 1..<prices.count {
      for k in (0..<i).reversed() {
        if k >= 2 {
          dp[i] = max(dp[i], prices[i] - prices[k] + dp[k-2])
        } else {
          dp[i] = max(dp[i], prices[i] - prices[k])
        }
      }
      dp[i] = max(dp[i], dp[i - 1])
      value = max(value, dp[i])
    }
    
    print(dp)
    
    return value
  }
}
