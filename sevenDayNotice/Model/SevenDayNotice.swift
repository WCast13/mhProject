//
//  SevenDayNotice.swift
//  
//
//  Created by WilliamCastellano on 4/26/18.
//

import Foundation
import RealmSwift

class SevenDayNotice: Object {
  @objc dynamic var dateAdded: Date?
  @objc dynamic var residentNotified: Resident?
  var rules = List<Rule>()
 
}

