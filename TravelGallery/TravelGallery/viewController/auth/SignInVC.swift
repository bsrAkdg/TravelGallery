//
//  SignInVC.swift
//  TravelGallery
//
//  Created by Büşra Serdaroğlu on 5.07.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit
import Firebase

class SignInVC : UIViewController {

    @IBOutlet weak var emailOrUsername: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    var isPasswordShowed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        password.setShowHideText()
    }
    
    @IBAction func signIn(_ sender: Any) {
        if emailOrUsername.text != "" {
            if password.text != "" {
                Auth.auth().signIn(withEmail: emailOrUsername.text!, password: password.text!) { (result, error) in
                      if error == nil {
                          // sign in success
                          self.performSegue(withIdentifier: "home", sender: nil)
                      } else {
                          self.showAlert(title: "Error", message: error?.localizedDescription ?? "Unknown Error")
                      }
                }
            } else {
                showAlert(title: "Error", message: "Please enter a password")
            }
        } else {
            showAlert(title: "Error", message: "Please enter a username or email")
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        performSegue(withIdentifier: "register", sender: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
