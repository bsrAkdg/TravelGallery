//
//  ViewControllerExtension.swift
//  TravelGallery
//
//  Created by Büşra Serdaroğlu on 12.07.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showEditableAlertDialog(title: String, message: String, placeHolder: String, buttonTitle: String, editableText :  @escaping (String) -> Void) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = placeHolder
        }
        
        let okAction = UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default) { (action) in
            let enteredText = (alertController.textFields![0].text ?? "") as String
            editableText(enteredText)
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func showAlert(title: String, message: String) {
           let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
           let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
           alert.addAction(action)
           self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertCompletion(title: String, message: String, completion : @escaping (Bool) -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
    
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (action) in
            completion(true)
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
}
