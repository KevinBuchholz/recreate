////
////  INTERRUPTOR MODEL.swift
////  recreate
////
////  Created by Kevin Buchholz on 5/23/23.
////
//
//import Foundation
//import UserNotifications
//
//
//class NotificationManager: ObservableObject {
//    static let instance = NotificationManager()
//    let options: UNAuthorizationOptions = [.alert, .sound, .badge]
//    func requestAuthorization(date: Date) {
//        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
//            if let error = error {
//                print("Error: \(error)")
//            } else {
//                print("Success")
//                self.scheduleNotification(date: date)
//            }
//        }
//    }
//    
//    func scheduleNotification(date: Date){
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
//    func cancelNotifications() {
//        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
//        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
//    }
//    
//    func clearBadge() {
//        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
//    }
//}
