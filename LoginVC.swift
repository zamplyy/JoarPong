//
//  LoginVC.swift
//  JoarPong
//
//  Created by Joar Karlson on 2017-07-09.
//  Copyright © 2017 Joar Karlson. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        
    
        
    }
    
    @IBAction func loginUser(_ sender: Any) {
        
        if let email = emailField.text , let password = passwordField.text {
            
                    Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                        if error == nil {
                            self.performSegue(withIdentifier: "SignIn", sender: nil)
                        } else {
                    Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                        if error != nil {
                            print("Cant LOGIN ")
                        } else {
                            self.performSegue(withIdentifier: "SignIn", sender: nil)
                        }
                    }
                }
                
            }
            
        }
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
