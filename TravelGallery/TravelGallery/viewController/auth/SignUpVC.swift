//
//  SignUpVC.swift
//  TravelGallery
//
//  Created by Büşra Serdaroğlu on 5.07.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC : UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordAgain: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        password.setShowHideText()
        passwordAgain.setShowHideText()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUp(_ sender: Any) {
        if email.text != "" {
            if username.text != "" {
                if password.text != "" {
                    if passwordAgain.text != "" {
                        
                        if password.text != passwordAgain.text {
                            showAlert(title: "Error", message: "Passwords are not matched")
                        } else {
                            Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (auth, error) in
                                  if error == nil {
                                    let userDictionary = ["email" : self.email.text!, "username": self.username.text!, "password" : self.password.text!]
                                    
                                    let fireStore = Firestore.firestore()
                                    fireStore.collection("User").addDocument(data: userDictionary) { (error) in
                                        if error == nil {
                                            self.performSegue(withIdentifier: "login", sender: nil)
                                        } else {
                                            self.showAlert(title: "Error", message: error?.localizedDescription ?? "Unknown Error")
                                        }
                                    }
                                  } else {
                                      self.showAlert(title: "Error", message: error?.localizedDescription ?? "Unknown Error")
                                  }
                              }
                        }
                    } else {
                        showAlert(title: "Error", message: "Please enter password again")
                    }
                } else {
                    showAlert(title: "Error", message: "Please enter a password")
                }
            } else {
                showAlert(title: "Error", message: "Please enter a username")
            }
        } else {
            showAlert(title: "Error", message: "Please enter a email")
        }
    }
}
