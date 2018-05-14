//
//  ResidentsViewController.swift
//  sevenDayNotice
//
//  Created by WilliamCastellano on 4/21/18.
//  Copyright © 2018 WCTech. All rights reserved.
//

import UIKit
import RealmSwift

class ResidentsViewController: UIViewController {
  
  var residentsArray: Results<Resident>?
  let realm = try! Realm()
  
  @IBOutlet var residentsTable: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    residentsArray = realm.objects(Resident.self).sorted(byKeyPath: "lotNumber", ascending: true)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    navigationController?.navigationBar.isHidden = false
    residentsTable.reloadData()
  }
  
  @IBAction func addNewResident(_ sender: Any) {
    performSegue(withIdentifier: "goToAddResident", sender: self)
  }
  
}
// MARK: - Table View

extension ResidentsViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return residentsArray?.count ?? 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let cellText = "\(residentsArray?[indexPath.row].lotNumber ?? ""): \(residentsArray?[indexPath.row].residentOneName ?? "n/a")"
    cell.textLabel?.text =  cellText
    return cell
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if let itemToDelete = residentsArray?[indexPath.row] {
      if editingStyle == .delete {
        do {
          try realm.write {
            realm.delete(itemToDelete)
          }
          tableView.deleteRows(at: [indexPath], with: .fade)
        } catch {
          print("Could not delete resident")
        }
      }
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "goToEditResident", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToEditResident" {
      let destinationVC = segue.destination as! EditResidentViewController
      
      if let indexPath = residentsTable.indexPathForSelectedRow {
        destinationVC.selectedResident = residentsArray?[indexPath.row]
      }
    } else {
      // DESTINATION FOR ADD RULES
    }
  }
}

