//
//  LoginViewController.swift
//  OnTheMap
//
//  Created by Azza on 6/21/19.
//  Copyright © 2019 Azza. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIStackView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        interfaceConfiguration(spin: false)
    }
    
    func interfaceConfiguration(spin: Bool) {
        switch spin {
        case true:
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        case false:
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        }
    }
    
    @IBAction func login(_ sender: Any) {
        interfaceConfiguration(spin: true)
        NetworkUtil.login(credentials: ["account": usernameTextField.text ?? "", "password" : passwordTextField.text ?? ""]) { (userSession, error) in
            guard let error = error else {
                self.queryLocations()
                if let key = self.delegate.currentUserSession?.account.key {
                    print("key", key)
                    NetworkUtil.getName(key: key, completion: { (user, error) in
                        guard let error = error else { return }
                        self.displayAlertMainQueue(error)
                    })
                }
                return
            }
            self.displayAlertMainQueue(error)
        }
    }
    
    /// Queries through NetworkUtil class which passes JSON Data via the Parse class.
    /// The Parse class uses data models (as Codable structs) which are located in the DataModels swift file.
    func queryLocations() {
        NetworkUtil.queryStudentLocations{ (studentLocations, error) in
            guard let error = error else {
                guard let studentLocations = studentLocations else {
                    self.displayAlertMainQueue(MapNetworkError.studenLocations)
                    return
                }
                for i in 0..<studentLocations.results.count {
                    self.delegate.studentLocationList.append(studentLocations.results[i])
                }
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: MapConstant.locationSegueId, sender: self)
                }
                return
            }
            self.displayAlertMainQueue(error)
        }
    }
    
}





