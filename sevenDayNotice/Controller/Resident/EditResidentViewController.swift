//
//  EditResidentViewController.swift
//  sevenDayNotice
//
//  Created by WilliamCastellano on 4/21/18.
//  Copyright © 2018 WCTech. All rights reserved.
//

import UIKit

class EditResidentViewController: UIViewController {

  @IBOutlet var residentLabel: UILabel!
  
  var selectedResident: Resident?
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      residentLabel.text =
      """
      Lot Number: \(selectedResident!.lotNumber)
      ResidentName: \(selectedResident!.residentOneName)
      State: \(selectedResident!.state)
      """

  }

}
