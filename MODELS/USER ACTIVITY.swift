//
//  USER ACTIVITY.swift
//  recreate
//
//  Created by Kevin Buchholz on 6/4/23.
//

import Foundation

struct UserActivity: Identifiable, Codable, Hashable {

    var name : String = ""
    var prompt : String = ""
    var interruptorTitle : String = ""
    var interruptorSubTitle: String = ""
    var outdoors : String = ""
    var indoors : String = ""
    var highEnergy : String = ""
    var lowEnergy : String = ""
    var relaxing : String = ""
    var stimulating : String = ""
    var id = UUID()
    
    init(raw: [String]) {
        name = raw[0]
        prompt = raw[1]
        interruptorTitle = raw[2]
        interruptorSubTitle = raw[3]
        outdoors = raw[4]
        indoors = raw[5]
        highEnergy = raw[6]
        lowEnergy = raw[7]
        relaxing = raw[8]
        stimulating = raw[9]
    }
}

//func stringToStruct(from userActivity : String) -> [UserActivity] {
//    var stringToStruct = [UserActivity]()
//
//
//
//
//    var data = ""
//    // split the long string into an array of "rows" of data. Each row is a string
//    // detect carriage return "\n" then split
//    var rows = data.components(separatedBy: "\n")
//
//    // remove header rows
//    // count the number of header columns before removing
//    let columnCount = rows.first?.components(separatedBy: ",").count
//    rows.removeFirst()
//
//    // loop around each row and split into columns
//    for row in rows {
//        let csvColumns = row.components(separatedBy: ",")
//        if csvColumns.count == columnCount {
//            let userActivityStruct = UserActivity.init(raw: csvColumns)
//            stringToStruct.append(userActivityStruct)
//        }
//    }
//
//    return stringToStruct
//}
