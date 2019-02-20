//
//  AddTipControllerViewController.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/20/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class AddTipControllerViewController: UIViewController {
  
  let addTipView = AddTipView()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(addTipView)
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(postButtonPressed))
    
    view.backgroundColor = .white
  }
  
  @objc func postButtonPressed() {
    
  }
  
  
}
