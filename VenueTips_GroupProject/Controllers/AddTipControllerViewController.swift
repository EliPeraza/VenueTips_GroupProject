
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
//  let userName = ""
  let tipEntereedByUser = ""
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(addTipView)
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(postButtonPressed))
    view.backgroundColor = .white
    
  }
  
  @objc func postButtonPressed() {
    
    //TODO: if there is text in field then check if there is text in username (if there is not, show alert letting user know that it will be marked anonymous)
    
    //DONE: generate object according to model
    //DONE: call data manager to add to the array
    

     let messageToSave =  addTipView.addTipField.text ?? "No review entered"
     let userName = addTipView.addUserNameField.text ?? "Anonymous"
//    if let venueIdToSave = venueID {
//      print("this is the venueIdToSave: \(venueIdToSave)")
//      let tipToSave = VenueTip.init(venueID: venueIdToSave, userName: userName, userTip: messageToSave, timeStamp: Date.getISOTimestamp())
//    DataManager.addTip(venueID: venueIdToSave, tip: tipToSave)
//    }
   // TODO: else (if there is no text in the addTipField display an alert about not being able to save)
    
   // TODO: IF text is empty user should not be able to post, display alert
    
    if !messageToSave.isEmpty && !userName.isEmpty {
        let alert = UIAlertController(title: "Comment Added", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
        if let venueIdToSave = venueID {
            print("this is the venueIdToSave: \(venueIdToSave)")
            let tipToSave = VenueTip.init(venueID: venueIdToSave, userName: userName, userTip: messageToSave, timeStamp: Date.getISOTimestamp())
            DataManager.addTip(venueID: venueIdToSave, tip: tipToSave)
        }
    } else if !messageToSave.isEmpty && userName.isEmpty {
        let alert  = UIAlertController(title: "You will be commenting anonymously", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
        if let venueIdToSave = venueID {
                print("this is the venueIdToSave: \(venueIdToSave)")
                let tipToSave = VenueTip.init(venueID: venueIdToSave, userName: userName, userTip: messageToSave, timeStamp: Date.getISOTimestamp())
                DataManager.addTip(venueID: venueIdToSave, tip: tipToSave)
        }
            let userName = "anonymous"
            if let venueIdToSave = venueID {
                print("this is the venueIdToSave: \(venueIdToSave)")
                let tipToSave = VenueTip.init(venueID: venueIdToSave, userName: userName, userTip: messageToSave, timeStamp: Date.getISOTimestamp())
                DataManager.addTip(venueID: venueIdToSave, tip: tipToSave)
            }
        
    } else if messageToSave.isEmpty && userName.isEmpty {
        let alert = UIAlertController(title: "One field Required", message: "Atleast one field is required!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    } else if messageToSave.isEmpty && !userName.isEmpty {
        let alert = UIAlertController(title: "Please add a comment", message: "", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    return
        }
    }

