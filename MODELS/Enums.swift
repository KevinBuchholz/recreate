//
//  File.swift
//  recreate
//
//  Created by Kevin Buchholz on 5/19/23.
//

import Foundation

enum BoatFloaters : String, CaseIterable, Identifiable, Codable, Hashable {
    
    var id: String {
        self.rawValue
    }
    case outside = "Outside"
    case inside = "Inside"
    case highEnergy = "High Energy"
    case lowEnergy = "Low Energy"
    case stimulating = "Stimulating"
    case relaxing = "Relaxing"
}

//enum Environment: String, CaseIterable, Identifiable, Codable {
//    
//    var id: String {
//        self.rawValue
//    }
//    case outside = "Outside"
//    case inside = "Inside"
//}

enum Energy: String, CaseIterable, Identifiable, Codable {
    
    var id: String {
        self.rawValue
    }
    case high = "High Energy"
    case low = "Low Energy"
}

enum Stimulation: String, CaseIterable, Identifiable, Codable {
    
    var id: String {
        self.rawValue
    }
    case stimulating = "Stimulating"
    case relaxing = "Relaxing"
}

enum SnarkFactor: String, CaseIterable, Identifiable, Codable {
    
    var id: String {
        self.rawValue
    }
    case mild = "Mild"
    case mildPlus = "Mild Plus"
    case medium = "Medium"
    case spicy = "Spicy"
    case hot = "Hot"
    case extraHot = "Obscene"
}



// Interrupters are tied to Activities, so the array of Interrupters is called by the Activity, meeting the parameters for SnarkFactor- each activity needs 6 Interrupters minimum.

// Onboarding and userpreferences will create a userList of Actions
