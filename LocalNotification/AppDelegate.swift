//
//  AppDelegate.swift
//  LocalNotification
//
//  Created by Rasikon on 02.12.2021.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public let notificationCenter = UNUserNotificationCenter.current()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
            
            guard success else { return }
            self.notificationCenter.getNotificationSettings { settings in
                guard settings.authorizationStatus == .authorized else { return }
            }
        }
        
        return true
    }
    
    public func scheduleNotification(notificationType: String) {
        
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = notificationType
        notificationContent.body = "Test Notification"
        notificationContent.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Local Notification", content: notificationContent, trigger: trigger)
        
        notificationCenter.add(request) { error in
            if let error = error {
                print("\(error.localizedDescription)")
            }
        }
    }
}

