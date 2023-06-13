//
//  USER ACTIVITY.swift
//  recreate
//
//  Created by Kevin Buchholz on 6/4/23.
//

import Foundation

struct UserActivity: Identifiable, Codable, Hashable {

    var activity : Activity
    var date : Date
    var id = UUID()
    var name: String {
        activity.name
    }
    var prompt: String {
        activity.prompt
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
