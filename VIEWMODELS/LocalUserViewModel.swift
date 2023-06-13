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
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("firstLaunchOfApp")
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            firstLaunchOfApp = try JSONDecoder().decode(Bool.self, from: data)
            loadUserActivities()
            //need a function that compares current date with activity date and if current date is > activity date, shows activity text
            
        } catch {
            firstLaunchOfApp = true
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(firstLaunchOfApp)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func saveUserActivites() {
        DirectoryService.writeModelToDisk(userActivities)
    }
    
    func loadUserActivities() {
        userActivities = DirectoryService.readModelFromDisk()
    }
    
    
    func saveArrayToStorage(array: [UserActivity]) {
        UserDefaults.standard.set(array, forKey: "assignedUserActivities")
    }

    func loadArrayFromStorage() -> [UserActivity]? {
        return UserDefaults.standard.array(forKey: "assignedUserActivities") as? [UserActivity]
    }
    
//    let encoder = JSONEncoder()
//if let encoded = try? encoder.encode(UserActivity(activity: Activity, date: Date)) {
//    let defaults = UserDefaults.standard
//    defaults.set(encoded, forKey: "SavedUserActivity")
//}
    
    
    //    struct UserPreferences : Decodable, Encodable {
    //        var firstLaunchOfApp : Bool
    //        var localUserTimeLine = [Date]()
    //        var outside : Bool
    //        var inside : Bool
    //        var highEnergy : Bool
    //        var lowEnergy : Bool
    //        var stimulating : Bool
    //        var relaxing : Bool
    //    }
    
    
//    var primaryViewActivityName : String = "flush"
//    var primaryViewActivityPrompt : String = "cory"
    @Published var firstLaunchOfApp : Bool
    @Published var userActivities : [Activity] = []
    @Published var assignedUserActivities: [UserActivity] = []
    @Published var localUserTimeLine = [Date]()
    let date = Date()
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
//                saveUserActivity()
                userActivities.append(activity)
            }
        }
    }
    
    //    func generateRandomActivity() {
    //        let randomActivity = userActivities.randomElement()
    //
    //        //do something
    //    }
    
//    func assignUserActivity() {
//        let randomActivity = userActivities.randomElement()
//        for _ in localUserTimeLine {
//            //  generateRandomActivity()
//            print(randomActivity.self?.name ?? "Default")
//            print(randomActivity.self?.prompt ?? "Default")
//        }
//    }
    
    // The user needs to say that they did the action.
    func iDidIt() {
        recreateProgress += 0.25
        socialProgress -= 0.25
        // dismiss badge and delivered notifications
        // add time to user progress
        // subtract time from socialmedia time
        // log or add a score to the activity to denote user engagement
    }
    
    func refresh() {
        // gives the user another activity prompt
        //.filter
    }
    
    
    
    
    //}
    
    //extension NotificationManager {
    //    static let instance = NotificationManager()
    var authorizedNotifications = false
    let options: UNAuthorizationOptions = [.alert, .sound, .badge]
    func requestAuthorization(date: Date) {
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("Error: \(error)")
                self.authorizedNotifications = false
                
            } else {
                print("Success")
                Task {
                    do {
                        try await self.scheduleCustomNotification(date: date)
                        self.authorizedNotifications = true
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    //    func scheduleNotification(date: Date){
    //
    //        let content = UNMutableNotificationContent()
    //        content.title = "This is the Interruptor Title."
    //        content.subtitle = "This is the Interruptor Subtitle."
    //        content.sound = .default
    //        content.badge = 1
    //
    //
    //        let dateComponents = Calendar.current.dateComponents([.hour, .minute, .timeZone], from: date)
    //        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
    //
    //
    //        let request = UNNotificationRequest(
    //            identifier: UUID().uuidString,
    //            content: content,
    //            trigger: trigger)
    //        UNUserNotificationCenter.current().add(request)
    //
    //    }
    
    func scheduleCustomNotification(date: Date) async throws {
        let randomActivity = userActivities.randomElement()!
        
        let content = UNMutableNotificationContent()
        content.title = randomActivity.interruptorTitle
        content.subtitle = randomActivity.interruptorSubTitle
        content.sound = .default
        content.badge = 1
        //Debugging print statements- comment out before test flight.
        
        print(randomActivity.interruptorTitle)
        print(randomActivity.interruptorSubTitle)
        print(randomActivity.name)
        print(randomActivity.prompt)
        
        
        let dateComponents = Calendar.current.dateComponents([.hour, .minute, .timeZone], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        try await UNUserNotificationCenter.current().add(request)
        
        assignedUserActivities.append(UserActivity(activity: randomActivity, date: date))
        saveUserActivites()
//        saveArrayToStorage(array: userActivities)
    }
    
    func cancelNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
    func clearBadge() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}
