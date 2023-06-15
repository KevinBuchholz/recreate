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
    
    init(activity: Activity, date: Date) {
        self.activity = activity
        self.date = date
    }
    
    // Save UserActivity to UserDefaults
    func saveUserActivity() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)
            UserDefaults.standard.set(data, forKey: "UserActivity")
        } catch {
            print("Failed to save UserActivity: \(error)")
        }
    }
    
    // Load UserActivity from UserDefaults
    static func loadUserActivity() -> UserActivity? {
        guard let data = UserDefaults.standard.data(forKey: "UserActivity") else {
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            let userActivity = try decoder.decode(UserActivity.self, from: data)
            return userActivity
        } catch {
            print("Failed to load UserActivity: \(error)")
            return nil
        }
    }
}

    
    
    

