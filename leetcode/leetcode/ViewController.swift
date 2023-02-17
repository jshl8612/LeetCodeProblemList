//
//  ViewController.swift
//  leetcode
//
//  Created by sykang on 2023/02/15.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    print(s_19().removeNthFromEnd([1,2,3,4,5,6], 2)?.toArray())
    print(s_19().removeNthFromEnd([1], 1)?.toArray())
    print(s_19().removeNthFromEnd([1,2], 1)?.toArray())
  }


}

