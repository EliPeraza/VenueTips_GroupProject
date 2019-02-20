//
//  AddTipView.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/20/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class AddTipView: UIView {

  
  lazy var addTipField: UITextField = {
    let tf = UITextField()
    tf.placeholder = "What's good here?"
    tf.textColor = #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)
    tf.backgroundColor = .white
    tf.font = UIFont(name: "Thonburi", size: 20)
//    tf.layer.borderColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
//    tf.layer.cornerRadius = 3.0
//    tf.layer.borderWidth = 1.0
    return tf
    
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    setupAddTipConstraints()
    commonInit()
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit() {
    setupAddTipConstraints()
  }
  
}

extension AddTipView {
  private func setupViewConstarints() {
    setupAddTipConstraints()
  }
  
  private func setupAddTipConstraints() {
    addSubview(addTipField)
    addTipField.translatesAutoresizingMaskIntoConstraints = false
    addTipField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
    addTipField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -11).isActive = true
    addTipField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
    addTipField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
  }
}

