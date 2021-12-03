//
//  NotificationsManager.swift
//  LocalNotification
//
//  Created by Rasikon on 03.12.2021.
//

import Foundation
import UserNotifications

public final class NotificationsManager {
    
    // MARK: Public propertise
    static let shared = NotificationsManager()
    
    
    // MARK: Private propertise
    private let notificationCenter = UNUserNotificationCenter.current()
    
    
    // MARK: Initializers
    private init() {}
    
    
    // MARK: Public methods
    public func requestAuthorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
            
            guard success else { return }
            self.notificationCenter.getNotificationSettings { settings in
                guard settings.authorizationStatus == .authorized else { return }
            }
        }
    }
    
    public func createNotification(notificationType: String, durationInSeconds: Double) {
        
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = notificationType
        notificationContent.body = "Test Notification"
        notificationContent.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: durationInSeconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Local Notification", content: notificationContent, trigger: trigger)
        
        notificationCenter.add(request) { error in
            if let error = error {
                print("\(error.localizedDescription)")
            }
        }
    }
}
