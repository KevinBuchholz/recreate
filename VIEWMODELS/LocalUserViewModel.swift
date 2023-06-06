//
//  PrimaryViewModel.swift
//  recreate
//
//  Created by Kevin Buchholz on 5/19/23.
//
import SwiftUI
import Foundation

// The PrimaryView needs a navigation to UserPreferences - probably doesn't need to be here.
// The PrimaryView needs a progress visualization.
// The PrimaryView needs to populate with prompt for the user to "do an activity" instead of looking at social media.

@MainActor class LocalUserViewModel: ObservableObject {
    
    @Published var firstLaunchOfApp : Bool = true

    @Published var localUserTimeLine = [Date]()
    var userLocale = Locale.autoupdatingCurrent
    var gregorianCalendar = Calendar(identifier: .gregorian)
    @Published var socialProgress = 1.0
    @Published var recreateProgress = 0.0
    
    @Published var outside : Bool = false
    @Published var inside : Bool = false
    @Published var highEnergy : Bool = false
    @Published var lowEnergy : Bool = false
    @Published var stimulating : Bool = false
    @Published var relaxing : Bool = false
    
    //All this needs to be saved to userDefaults
    @Published var activities = loadCSV(from: "Activities CSV")
    var userEnvironment : [Activity] = []
    var userEnergy : [Activity] = []
    @Published var userActivities : [Activity] = []
//    @Published var randomActivity : Activity? 
    
    func userActivitiesSort() {
        // filter through [Activities] and create an environment array that only matches user's environment preferences
        for activity in activities {
            if activity.outdoors == "true" && outside == true || activity.indoors == "true" && inside == true {
                userEnvironment.append(activity)
            }
        }
        // filter through [userEnvironment] and create an energy array that only matches user's energy preferences.
        for activity in userEnvironment {
            if activity.highEnergy == "true" && highEnergy == true || activity.lowEnergy == "true" && lowEnergy == true {
                userEnergy.append(activity)
            }
        }
        //filter through [userEnergy] and create a userActivities array that matches all the user's preferences.
        for activity in userEnergy {
            if activity.stimulating == "true" && stimulating == true || activity.relaxing == "true" && relaxing == true {
               userActivities.append(activity)
            }
        }
    }
    
    func generateRandomActivity() {
        let randomActivity = userActivities.randomElement()
        print(randomActivity.self?.name ?? "Default")
        print(randomActivity.self?.prompt ?? "Default")
    }

    // The user needs to say that they did the action.
    func iDidIt() {
        recreateProgress += 0.2
        socialProgress -= 0.2
        // dismiss badge and delivered notifications
        // add time to user progress
        // subtract time from socialmedia time
        // log or add a score to the activity to denote user engagement
    }
    
    func refresh() {
        // gives the user another activity prompt
    }
    
    
    
}
