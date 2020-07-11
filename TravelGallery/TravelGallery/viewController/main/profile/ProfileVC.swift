//
//  ProfileVC.swift
//  TravelGallery
//
//  Created by Büşra Serdaroğlu on 5.07.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOut(_ sender: Any) {
        do {
            try  Auth.auth().signOut()
            self.performSegue(withIdentifier: "login", sender: nil)
        } catch {
            
        }
    }
}
