//
//  AddResidentViewController.swift
//  sevenDayNotice
//
//  Created by WilliamCastellano on 4/21/18.
//  Copyright © 2018 WCTech. All rights reserved.
//

import UIKit
import RealmSwift

class AddResidentViewController: UIViewController {
  
  let realm = try! Realm()
  
  @IBOutlet var lotNumber: UITextField!
  @IBOutlet var residentOne: UITextField!
  @IBOutlet var residentTwo: UITextField!
  @IBOutlet var address: UITextField!
  @IBOutlet var city: UITextField!
  @IBOutlet var state: UITextField!
  @IBOutlet var zipCode: UITextField!
  @IBOutlet var statusLabel: UILabel!
  
  @IBAction func addResident(_ sender: Any) {
    let resident = Resident()
    
    
    guard let lotNumber = lotNumber.text else {
      print("No lot number")
      return
    }
    
    guard let resOne = residentOne.text else {
      return
    }
    
    guard let resTwo = residentTwo.text else {
      return
    }
    
    guard let address = address.text else {
      return
    }
    
    guard let city = city.text else {
      return
    }
    
    guard let state = state.text else {
      return
    }
    
    guard let zipCode = zipCode.text else {
      return
    }
    
    resident.lotNumber = lotNumber
    resident.residentOneName = resOne
    resident.residentTwoName = resTwo
    resident.address = address
    resident.city = city
    resident.state = state
    resident.zipCode = zipCode
    
    do {
      try realm.write {
        realm.add(resident)
      }
    } catch {
      print("Error Saving Resident")
    }
    
    statusLabel.text = "Resident \(resOne) in lot \(lotNumber) has successfully been added!"
    
    residentOne.text = ""
    residentTwo.text = ""
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
}
