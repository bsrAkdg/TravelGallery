//
//  TextFieldExtension.swift
//  TravelGallery
//
//  Created by Büşra Serdaroğlu on 11.07.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    

    func setShowHideText() {
        
        let button = UIButton(type: .custom)
        
        //  icons
        let boldSearchEye = UIImage(systemName: "eye.slash")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        let boldSearchEyeSlash = UIImage(systemName: "eye")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
          
        button.setImage(boldSearchEye, for: .selected)
        button.setImage(boldSearchEyeSlash, for: .normal)

        // size
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 40), y: CGFloat(5), width: CGFloat(40), height: CGFloat(30))
        
        button.addTarget(self, action: #selector(self.refresh), for: .touchUpInside)


        self.rightView = button
        self.rightViewMode = .always
        self.isSecureTextEntry = true

    }
    
    @IBAction func refresh(_ sender: Any) {
        if let button = sender as? UIButton {
            if button.isSelected {
                self.isSecureTextEntry = true
            } else {
                self.isSecureTextEntry = false
            }
            button.isSelected = !button.isSelected
        }
    }

}
