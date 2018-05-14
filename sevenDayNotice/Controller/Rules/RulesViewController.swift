//
//  RulesViewController.swift
//  sevenDayNotice
//
//  Created by WilliamCastellano on 4/21/18.
//  Copyright © 2018 WCTech. All rights reserved.
//

import UIKit
import RealmSwift

class RulesViewController: UIViewController {

  @IBOutlet var rulesTableview: UITableView!
  
  let realm = try! Realm()
  var rulesArray: Results<Rule>?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    rulesArray = realm.objects(Rule.self).sorted(byKeyPath: "number", ascending: false)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    navigationController?.navigationBar.isHidden = false
    rulesTableview.reloadData()
  }


  @IBAction func goToAddRule(_ sender: Any) {
    performSegue(withIdentifier: "goToNewRule", sender: self)
  }
}

extension RulesViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return rulesArray?.count ?? 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let cellText = "\(rulesArray?[indexPath.row].number ?? "n/a"): \(rulesArray?[indexPath.row].title ?? "n/a")"
    cell.textLabel?.textColor = UIColor.blue
    cell.textLabel?.text = cellText
    return cell
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if let itemToDelete = rulesArray?[indexPath.row] {
      if editingStyle == .delete {
        do {
          try realm.write {
            realm.delete(itemToDelete)
          }
        } catch {
          print("could not delete rule")
        }
      }
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "goToEditRule", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToEditRule" {
      let destinationVC = segue.destination as! EditRuleViewController
      
      if let indexPath = rulesTableview.indexPathForSelectedRow {
        destinationVC.selectedRule = rulesArray?[indexPath.row]
      }
    }
  }
}








































