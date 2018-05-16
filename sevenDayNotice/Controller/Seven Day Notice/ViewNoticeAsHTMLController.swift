//
//  ViewNoticeAsHTMLController.swift
//  sevenDayNotice
//
//  Created by WilliamCastellano on 5/15/18.
//  Copyright © 2018 WCTech. All rights reserved.
//

import UIKit
import RealmSwift
import WebKit

class ViewNoticeAsHTMLController: UIViewController {
 
  @IBOutlet var noticeWebView: WKWebView!
  
  var selectedNotice: SevenDayNotice?
  
    override func viewDidLoad() {
        super.viewDidLoad()

      print(selectedNotice)
    }

}
