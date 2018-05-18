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
      
      let html = formatRules(notice: notice)
      
      noticeHTML = noticeHTML.replacingOccurrences(of: "#Rules#", with: html.rulesHTML)
      noticeHTML = noticeHTML.replacingOccurrences(of: "#BulletPoints#", with: html.bulletsHTML)
      noticeHTML = noticeHTML.replacingOccurrences(of: "#Summary#", with: html.summaryHTML)
      
      
    } catch {
      print("Could not load the HTML")
    }
    
    return noticeHTML
  }
  
  func formatRules(notice: SevenDayNotice) -> (rulesHTML: String, bulletsHTML: String, summaryHTML: String) {
    
    var rulesHTML = ""
    var bulletsHTML = ""
    var summaryHTML = ""
    
    for rule in notice.rules {
      do {
        var individualRuleHTML = ""
        individualRuleHTML = try String.init(contentsOfFile: Bundle.main.path(forResource: "rules", ofType: "html") ?? "No such data")
        
        individualRuleHTML = individualRuleHTML.replacingOccurrences(of: "#RuleNumber#", with: rule.number)
        individualRuleHTML = individualRuleHTML.replacingOccurrences(of: "#RuleBody#", with: rule.body)
        individualRuleHTML = individualRuleHTML.replacingOccurrences(of: "#RuleTitle#", with: rule.title)
        
        rulesHTML.append(individualRuleHTML)
        
        var individualBulletHTML = ""
        individualBulletHTML = try String.init(contentsOfFile: Bundle.main.path(forResource: "bullets", ofType: "html") ?? "No such data")
        individualBulletHTML = individualBulletHTML.replacingOccurrences(of: "#Bullets#", with: rule.bulletPoint)
        
        bulletsHTML.append(individualBulletHTML)
        
        var individualSummaryHTML = ""
        individualSummaryHTML = try String.init(contentsOfFile: Bundle.main.path(forResource: "summary", ofType: "html") ?? "No such data")
        individualSummaryHTML = individualSummaryHTML.replacingOccurrences(of: "#Summary#", with: rule.solution)
        
        summaryHTML.append(individualSummaryHTML)

      } catch {
        print(error)
      }
    }
    return (rulesHTML, bulletsHTML, summaryHTML)
  }
}

