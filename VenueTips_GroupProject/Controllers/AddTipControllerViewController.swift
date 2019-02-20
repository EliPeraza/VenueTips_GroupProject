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
  let userName = ""
  let tipEntereedByUser = ""
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(addTipView)
    addTipView.addTipField.delegate = self
    addTipView.addUserNameField.delegate = self
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(postButtonPressed))
    view.backgroundColor = .white
    
  }
  
  @objc func postButtonPressed() {
    
    //TODO: if there is text in field then check if there is text in username (if there is not, show alert letting user know that it will be marked anonymous)
    
    //DONE: generate object according to model
    //DONE: call data manager to add to the array

    let messageToSave =  addTipView.addTipField.text ?? "No review entered"
  
    if let venueIdToSave = venueID {
      print("this is the venueIdToSave: \(venueIdToSave)")
      let tipToSave = VenueTip.init(venueID: venueIdToSave, userName: "Eli", userTip: messageToSave, timeStamp: Date.getISOTimestamp())
    DataManager.addTip(venueID: venueIdToSave, tip: tipToSave)
    }
    //TODO: else (if there is no text in the addTipField display an alert about not being able to save)
    
    //TODO: IF text is empty user should not be able to post, display alert
    
  }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(true)
        registerKeyboardNotifications()
    }
    
    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willHideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func willShowKeyboard(notification: Notification) {
        guard let info = notification.userInfo,
            let keyboardFrame = info["UIKeyboardFrameEndUserInfoKey"] as? CGRect else {
                print("userinfo is nil")
                return
        }
        addTipView.transform = CGAffineTransform(translationX: 0, y: -keyboardFrame.height)
    }
    
    @objc private func willHideKeyboard(notification: Notification) {
        addTipView.transform = CGAffineTransform.identity
    }
    
    private func unregisterKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        unregisterKeyboardNotifications()
    }
  
  }

extension AddTipControllerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
