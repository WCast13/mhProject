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
  
  func renderHTML(notice: SevenDayNotice) -> String {
    
    var noticeHTML = ""
    
    do {
      noticeHTML = try String.init(contentsOfFile: Bundle.main.path(forResource: "notice", ofType: "html") ?? "No such data")
      
      noticeHTML = noticeHTML.replacingOccurrences(of: "#ResidentOne#", with: notice.residentNotified!.residentOneName)
      noticeHTML = noticeHTML.replacingOccurrences(of: "#ResidentTwo#", with: notice.residentNotified!.residentTwoName)
      noticeHTML = noticeHTML.replacingOccurrences(of: "#LotNumber#", with: notice.residentNotified!.lotNumber)
      noticeHTML = noticeHTML.replacingOccurrences(of: "#Address#", with: notice.residentNotified!.address)
      
      let cityState = notice.residentNotified!.city + " " + notice.residentNotified!.state + ", " + notice.residentNotified!.zipCode
      noticeHTML = noticeHTML.replacingOccurrences(of: "#CityState#", with: cityState)
      
      let rulesHTML = formatRules(notice: notice)
      
      noticeHTML = noticeHTML.replacingOccurrences(of: "#Rules#", with: rulesHTML)
      
      
      
      //      noticeHTML = noticeHTML.replacingOccurrences(of: <#T##StringProtocol#>, with: <#T##StringProtocol#>)
      
    } catch {
      print("Could not load the HTML")
    }
    
    return noticeHTML
  }
  
  func formatRules(notice: SevenDayNotice) -> String {
    
    var rulesHTML = ""
    
    for rule in notice.rules {
      do {
        rulesHTML = try String.init(contentsOfFile: Bundle.main.path(forResource: "rules", ofType: "html") ?? "No such data")
        
        rulesHTML = rulesHTML.replacingOccurrences(of: "#RuleNumber#", with: rule.number)
        rulesHTML = rulesHTML.replacingOccurrences(of: "#RuleBody#", with: rule.body)
        rulesHTML = rulesHTML.replacingOccurrences(of: "#RuleTitle#", with: rule.title)
      } catch {
        print(error)
      }
    }
   
    return rulesHTML
  }
}






//#Rules#
//#BulletPoints#
//#Summary#
//#Date#
