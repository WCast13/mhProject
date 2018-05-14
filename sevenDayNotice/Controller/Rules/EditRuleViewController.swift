//
//  EditRuleViewController.swift
//  sevenDayNotice
//
//  Created by WilliamCastellano on 4/26/18.
//  Copyright © 2018 WCTech. All rights reserved.
//

import UIKit
import RealmSwift

class EditRuleViewController: UIViewController {
  
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var bodyLabel: UILabel!
  @IBOutlet var summaryLabel: UILabel!
  @IBOutlet var solutionLabel: UILabel!
  
  var selectedRule: Rule?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    titleLabel.text = "\(selectedRule?.number ?? "") \(selectedRule?.title ?? "")"
    bodyLabel.text = "\(selectedRule?.body ?? "No rule selected")"
    summaryLabel.text = "\(selectedRule?.bulletPoint ?? "")"
    solutionLabel.text = "\(selectedRule?.solution ?? "")"
  }
  
}
