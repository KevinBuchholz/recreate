//
//  ACTIVITIES.swift
//  recreate
//
//  Created by Kevin Buchholz on 5/19/23.

import Foundation

struct Activity: Identifiable, Codable, Hashable {

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
//    var date : Date?
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

func loadCSV(from csvName : String) -> [Activity] {
    var csvToStruct = [Activity]()
    
    //locate the csv file
    guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") else {
        return []
    }
    
    //convert contents of the file into one very long string
    var data = ""
    do {
        data = try String(contentsOfFile: filePath)
    } catch {
        print(error)
        return []
    }
    
    // split the long string into an array of "rows" of data. Each row is a string
    // detect carriage return "\n" then split
    var rows = data.components(separatedBy: "\n")
    
    // remove header rows
    // count the number of header columns before removing
    let columnCount = rows.first?.components(separatedBy: ",").count
    rows.removeFirst()
    
    // loop around each row and split into columns
    for row in rows {
        let csvColumns = row.components(separatedBy: ",")
        if csvColumns.count == columnCount {
            let activityStruct = Activity.init(raw: csvColumns)
            csvToStruct.append(activityStruct)
        }
    }
        
    return csvToStruct
}
   
