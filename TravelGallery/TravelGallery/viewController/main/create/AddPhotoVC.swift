//
//  AddPhotoVC.swift
//  TravelGallery
//
//  Created by Büşra Serdaroğlu on 5.07.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit
import MapKit

class AddPhotoVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageDescription: UITextView!
    
    @IBOutlet weak var city: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
