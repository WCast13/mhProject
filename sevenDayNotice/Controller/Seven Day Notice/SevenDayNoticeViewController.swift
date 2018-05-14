//
//  SevenDayNoticeViewController.swift
//  sevenDayNotice
//
//  Created by WilliamCastellano on 4/27/18.
//  Copyright © 2018 WCTech. All rights reserved.
//

import UIKit

class SevenDayNoticeViewController: UIViewController {

  @IBOutlet var noticeTableView: UITableView!
  
  override func viewDidLoad() {
        super.viewDidLoad()

    navigationController?.navigationBar.isHidden = false
      
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
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    cell.textLabel?.text = "\(indexPath.row)"
    cell.textLabel?.textAlignment = .center
    
    return cell
  }
}
