//
//  ViewController.swift
//  sevenDayNotice
//
//  Created by WilliamCastellano on 4/12/18.
//  Copyright © 2018 WCTech. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

  let realm = try! Realm()
  
  override func viewDidLoad() {
    super.viewDidLoad()
      
  }
  
  override func viewDidAppear(_ animated: Bool) {
    navigationController?.navigationBar.isHidden = true
  }

  @IBAction func goToResidents(_ sender: Any) {
    performSegue(withIdentifier: "goToResidents", sender: self)
  }
  
  @IBAction func goToRules(_ sender: Any) {
    performSegue(withIdentifier: "goToRules", sender: self)
  }
  
  @IBAction func goToSevenDayNotices(_ sender: Any) {
    performSegue(withIdentifier: "goToSevenDayNotice", sender: self)
  }
}

