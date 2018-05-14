//
//  Rule.swift
//  sevenDayNotice
//
//  Created by WilliamCastellano on 4/12/18.
//  Copyright © 2018 WCTech. All rights reserved.
//

import Foundation
import RealmSwift

class Rule: Object {
  @objc dynamic var number = ""
  @objc dynamic var title = ""
  @objc dynamic var body = ""
  @objc dynamic var bulletPoint = ""
  @objc dynamic var solution = ""
  var parentNotice = LinkingObjects(fromType: sevenDayNotice.self, property: "rules")
}
