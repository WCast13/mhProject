//
//  Resident.swift
//  sevenDayNotice
//
//  Created by WilliamCastellano on 4/12/18.
//  Copyright © 2018 WCTech. All rights reserved.
//

import Foundation
import RealmSwift

class Resident: Object {
  @objc dynamic var residentOneName = ""
  @objc dynamic var residentTwoName = ""
  @objc dynamic var lotNumber = ""
  @objc dynamic var address = ""
  @objc dynamic var city = ""
  @objc dynamic var state = ""
  @objc dynamic var zipCode = ""
}
