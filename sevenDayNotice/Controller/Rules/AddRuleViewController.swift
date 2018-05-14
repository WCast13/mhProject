//
//  AddRuleViewController.swift
//  sevenDayNotice
//
//  Created by WilliamCastellano on 4/24/18.
//  Copyright © 2018 WCTech. All rights reserved.
//

import UIKit
import RealmSwift

class AddRuleViewController: UIViewController {

  let realm = try! Realm()
  
  @IBOutlet var ruleNumberTextField: UITextField!
  @IBOutlet var titleTextField: UITextField!
  @IBOutlet var ruleBodyTextView: UITextView!
  @IBOutlet var summaryTextView: UITextView!
  @IBOutlet var solutionTextView: UITextView!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  @IBAction func addNewRule(_ sender: Any) {
    let rule = Rule()
    
    guard let ruleNumber = ruleNumberTextField.text else {
      return
    }
    
    guard let title = titleTextField.text else {
      return
    }
    
    guard let body = ruleBodyTextView.text else {
      return
    }
    
    guard let summary = summaryTextView.text else {
      return
    }
    
    guard let solution = solutionTextView.text else {
      return
    }
    
    rule.number = ruleNumber
    rule.title = title
    rule.body = body
    rule.bulletPoint = summary
    rule.solution = solution
    
    
    do {
      try realm.write {
        realm.add(rule)
      }
    } catch {
      print("Error saving rule")
    }
  }
}
