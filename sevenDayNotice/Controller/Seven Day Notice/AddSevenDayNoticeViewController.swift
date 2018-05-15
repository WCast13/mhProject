//
//  AddSevenDayNoticeViewController.swift
//  sevenDayNotice
//
//  Created by WilliamCastellano on 4/27/18.
//  Copyright © 2018 WCTech. All rights reserved.
//

import UIKit
import RealmSwift

class AddSevenDayNoticeViewController: UIViewController {
  
  let realm = try! Realm()
  
  var residentsArray: Results<Resident>?
  var rulesArray: Results<Rule>?
  var selectedRules: List<Rule>?
  var selectedRulesArray = [Rule]()
  
  @IBOutlet var lotNumberTextfield: UITextField!
  @IBOutlet var addRulesTableview: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    residentsArray = realm.objects(Resident.self)
    rulesArray = realm.objects(Rule.self)
  }
  
  @IBAction func addSevenDayNotice(_ sender: Any) {
    
    let notice = SevenDayNotice()
    
    guard let searchedResident = lotNumberTextfield.text else {
      print("please enter valid lot nummber")
      return
    }
    
    notice.dateAdded = Date()
    
    if let resident = residentsArray?.filter("lotNumber ==% @", searchedResident).first {
      notice.residentNotified = resident
    } else {
      print("Could not find the resident you were looking for")
    }
    
    let numberOfItems = selectedRulesArray.count
    
    if numberOfItems > 0 {
      for item in selectedRulesArray {
      notice.rules.append(item)
      }
    } else {
      print("Add items to notice")
    }
   
    saveNotice(notice: notice)
  }
  
}

extension AddSevenDayNoticeViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return rulesArray?.count ?? 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    cell.textLabel?.textColor = UIColor.red
    cell.textLabel?.textAlignment = .center
    let cellText = "\(rulesArray?[indexPath.row].number ?? "n/a"): \(rulesArray?[indexPath.row].title ?? "n/a")"
    cell.textLabel?.text = cellText
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    if let indexPath = tableView.indexPathForSelectedRow {
      let selectedRule = rulesArray?[indexPath.row]
      selectedRulesArray.append(selectedRule!)
      print("Rule added: \(selectedRule?.title ?? "")")
      print(selectedRulesArray)
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func saveNotice(notice: SevenDayNotice) {
    do {
      try realm.write {
        realm.add(notice)
      }
    } catch {
      print("Error saving notice: \(error)")
    }
  }
}
