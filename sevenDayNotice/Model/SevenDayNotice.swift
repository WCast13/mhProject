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
 
  func renderHTML(notice: SevenDayNotice) {

    var noticeHTML = ""

    do {
      noticeHTML = try String.init(contentsOfFile: Bundle.main.path(forResource: "notice", ofType: "html") ?? "No such data")

      noticeHTML = noticeHTML.replacingOccurrences(of: "#ResidentOne#", with: notice.residentNotified!.residentOneName)
      noticeHTML = noticeHTML.replacingOccurrences(of: "#ResidentTwo#", with: notice.residentNotified!.residentTwoName)
      noticeHTML = noticeHTML.replacingOccurrences(of: "#LotNumber#", with: notice.residentNotified!.lotNumber)
      noticeHTML = noticeHTML.replacingOccurrences(of: "#Address#", with: notice.residentNotified!.address)

      let cityState = notice.residentNotified!.city + " " + notice.residentNotified!.state + ", " + notice.residentNotified!.zipCode
      noticeHTML = noticeHTML.replacingOccurrences(of: "#CityState#", with: cityState)



//      noticeHTML = noticeHTML.replacingOccurrences(of: <#T##StringProtocol#>, with: <#T##StringProtocol#>)
//      noticeHTML = noticeHTML.replacingOccurrences(of: <#T##StringProtocol#>, with: <#T##StringProtocol#>)

    } catch {
      print("Could not load the HTML")
    }

    print(noticeHTML)
  }
}






//#Rules#
//#BulletPoints#
//#Summary#
//#Date#
