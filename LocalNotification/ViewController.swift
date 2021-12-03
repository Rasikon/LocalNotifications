//
//  ViewController.swift
//  LocalNotification
//
//  Created by Rasikon on 02.12.2021.
//

import UIKit

public final class ViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet private weak var getPushButton: UIButton!
    
    
    // MARK: Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        applyStyle()
        NotificationsManager.shared.requestAuthorization()
    }
    
    
    // MARK: Actions
    @IBAction private func pressGetPushButton(_ sender: UIButton) {
        launchAlert(duration: 5)
    }
    
    
    // MARK: Private methods
    private func applyStyle() {
        getPushButton.layer.cornerRadius = 10
    }
    
    private func launchAlert(duration: Double) {
        let title = "Local Notification"
        let alert = UIAlertController(title: title, message: "A notification will be sent in \(duration) seconds", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            NotificationsManager.shared.createNotification(notificationType: title, durationInSeconds: duration)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

