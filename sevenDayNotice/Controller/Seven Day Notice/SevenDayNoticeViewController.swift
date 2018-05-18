//
//  SevenDayNoticeViewController.swift
//  sevenDayNotice
//
//  Created by WilliamCastellano on 4/27/18.
//  Copyright © 2018 WCTech. All rights reserved.
//

import UIKit
import RealmSwift

class SevenDayNoticeViewController: UIViewController {
  
  var noticesArray: Results<SevenDayNotice>?
  let realm = try! Realm()
  
  
  @IBOutlet var noticeTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.isHidden = false
    
    noticesArray = realm.objects(SevenDayNotice.self)
    
    let dateFormatter = DateFormatter()
    
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .none
  }
  
  override func viewDidAppear(_ animated: Bool) {
    noticeTableView.reloadData()
  }
  
  @IBAction func goToAddNotice(_ sender: Any) {
    performSegue(withIdentifier: "goToAddNotice", sender: self)
  }
}

extension SevenDayNoticeViewController: UITableViewDataSource, UITableViewDelegate {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return noticesArray?.count ?? 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    let date = noticesArray?[indexPath.row].dateAdded
    let resident = noticesArray?[indexPath.row].residentNotified?.lotNumber
    
    let cellText = "\(date!): \(resident!)"
    
    cell.textLabel?.text = cellText
    cell.textLabel?.textAlignment = .center
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "goToViewNotice", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToViewNotice" {
       let destinationVC = segue.destination as! ViewNoticeAsHTMLController
      
      if let indexPath = noticeTableView.indexPathForSelectedRow {
        destinationVC.selectedNotice = noticesArray?[indexPath.row]
      }
    }
  }
}
