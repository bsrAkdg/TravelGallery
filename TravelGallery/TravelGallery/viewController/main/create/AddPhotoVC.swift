//
//  AddPhotoVC.swift
//  TravelGallery
//
//  Created by Büşra Serdaroğlu on 5.07.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData
import Firebase
import FirebaseFirestore

class AddPhotoVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageDescription: UITextView!
    @IBOutlet weak var city: UILabel!
    
    var locationManager = CLLocationManager()
    var choosenLatitude = Double()
    var choosenLongitude = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigation()
        setLocation()
        setImageActions()
        // Do any additional setup after loading the view.
    }
    
    func setNavigation() {
        navigationItem.title = "New Photo"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: #selector(saveImage))
    }
    
    func setLocation() {
        mapView.delegate = self
        locationManager.delegate = self
         
        // The receiver does its best to achieve the requested accuracy; however, the actual accuracy is not guaranteed.
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Requests the user’s permission to use location services while the app is in use.
        locationManager.requestWhenInUseAuthorization()
        
        // Starts the generation of updates that report the user’s current location.
        locationManager.startUpdatingLocation()
        
        // add gesture recognizer for location selection
        let longGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        longGestureRecognizer.minimumPressDuration = 3
        mapView.addGestureRecognizer(longGestureRecognizer)
    }
    
    func setImageActions() {
        // open gallery when clicked imageview
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(openGallery))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    // updated location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Step 1 : receive updated location
        let updatedLocation = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
                  
        // Step 2 : zoom updated location region
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: updatedLocation, span: span)
                  
        mapView.setRegion(region, animated: true)
    }
    
    // pin customize
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil // do not show user location
        }
        
        let pinView = mapView.dequeueReusableAnnotationView(withIdentifier: "photoLocation") as? MKPinAnnotationView
        
        if pinView == nil {
            pinView?.canShowCallout = true // show extra detail
            pinView?.tintColor = UIColor.red // change pin color
        } else {
            pinView?.annotation = annotation
        }
        
        return pinView
    }

    @objc func chooseLocation(gestureRecognizer : UILongPressGestureRecognizer) {

        if gestureRecognizer.state == .began {
            
            // Step 1 : receive coordinate informations from mapview
            let touchedPoint = gestureRecognizer.location(in: mapView)
            let touchedCoordinate = mapView.convert(touchedPoint, toCoordinateFrom: mapView)
            
            // Step 2 : keep location information
            choosenLatitude = touchedCoordinate.latitude
            choosenLongitude = touchedCoordinate.longitude
            
            // Step 3 : create a annotation for showing
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchedCoordinate
            annotation.title = "Selected Location"
            mapView.addAnnotation(annotation)
            
        }
    }
    
    @objc func openGallery() {
        let galleryPickerView = UIImagePickerController()
        galleryPickerView.delegate = self
        galleryPickerView.sourceType = .photoLibrary
        self.present(galleryPickerView, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func saveImage() {
        
    }

}
