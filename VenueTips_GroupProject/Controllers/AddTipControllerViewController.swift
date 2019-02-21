
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
  var venueID: String?
  let tipEntereedByUser = ""
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(addTipView)
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(postButtonPressed))
    view.backgroundColor = .white
    
  }
  
  @objc func postButtonPressed() {
    
    let messageToSave =  addTipView.addTipField.text ?? "No review entered"
    let userName = addTipView.addUserNameField.text ?? "Anonymous"
    
    if !messageToSave.isEmpty && !userName.isEmpty {
      if let venueIdToSave = venueID {
        let tipToSave = VenueTip.init(venueID: venueIdToSave, userName: userName, userTip: messageToSave, timeStamp: Date.getISOTimestamp())
        DataManager.addTip(venueID: venueIdToSave, tip: tipToSave)
      }
      let alert = UIAlertController(title: "Comment Added", message: nil, preferredStyle: .alert)
      let ok = UIAlertAction(title: "Ok", style: .default) { (okAction) in
        self.navigationController?.popViewController(animated: true)
      }
      alert.addAction(ok)
      self.present(alert, animated: true, completion: nil)
      
    } else if !messageToSave.isEmpty && userName.isEmpty {
      let alert  = UIAlertController(title: "You will be commenting anonymously", message: nil, preferredStyle: .alert)
      let ok = UIAlertAction.init(title: "Ok", style: .default) { (okAction) in
        if let venueIdToSave = self.venueID {
          let tipToSave = VenueTip.init(venueID: venueIdToSave, userName: "Anonymous", userTip: messageToSave, timeStamp: Date.getISOTimestamp())
          DataManager.addTip(venueID: venueIdToSave, tip: tipToSave)
        }
        self.navigationController?.popViewController(animated: true)
      }
      let cancel = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
      alert.addAction(ok)
      alert.addAction(cancel)
      self.present(alert, animated: true, completion: nil)
    } else if messageToSave.isEmpty && !userName.isEmpty {
      let alert = UIAlertController(title: "Please add a comment to proceed", message: "or press cancel to go back", preferredStyle: .alert)
      let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
      let cancel = UIAlertAction.init(title: "Cancel", style: .cancel) { (cancelAction) in
        self.navigationController?.popViewController(animated: true)
      }
      alert.addAction(ok)
      alert.addAction(cancel)
      self.present(alert, animated: true, completion: nil)
    } else if messageToSave.isEmpty && userName.isEmpty {
      let alert = UIAlertController(title: "Comment required to post", message: "Please press ok to continue or cancel to go back", preferredStyle: .alert)
      let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
      let cancel = UIAlertAction.init(title: "Cancel", style: .cancel) { (cancelAction) in
        self.navigationController?.popViewController(animated: true)
      }
      alert.addAction(ok)
      alert.addAction(cancel)
      self.present(alert, animated: true, completion: nil)
      return
    }
  }
}

