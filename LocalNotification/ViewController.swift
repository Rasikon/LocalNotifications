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
    
    
    // MARK: Private propertise
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    
    // MARK: Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        applyStyle()
    }
    
    
    // MARK: Actions
    @IBAction private func pressGetPushButton(_ sender: UIButton) {
        launchAlert()
    }
    
    
    // MARK: Private methods
    private func applyStyle() {
        getPushButton.layer.cornerRadius = 10
    }
    
    private func launchAlert() {
        let title = "Local Notification"
        let alert = UIAlertController(title: title, message: "A notification will be sent in 10 seconds", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            self.appDelegate?.scheduleNotification(notificationType: title)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

