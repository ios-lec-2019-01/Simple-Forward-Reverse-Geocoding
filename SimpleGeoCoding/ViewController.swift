//  XCode 11.1
//  ViewController.swift
//  SimpleGeoCoding
//
//  Created by amadeus on 07/10/2019.
//  Copyright © 2019 DIT Apps. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var annotations = [MKPointAnnotation]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Forward Geocoding
        let addr = "부산광역시 양정동 429-19"
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(addr, completionHandler: { placemarks, error in
            
            if error != nil {
                print(error!)
            }
            
            if let myPlacemark = placemarks {
                let myPlacemark = myPlacemark[0]
                print(myPlacemark.location!)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = myPlacemark.location!.coordinate
                annotation.title = "동의과학대학교"
                annotation.subtitle = "우리들의 꿈이 자라는 곳"
                
                self.annotations.append(annotation)
                
                //self.mapView.addAnnotation(annotation)
                self.mapView.showAnnotations(self.annotations, animated: true)
            }
        })
        
        // Revere Geoocoding
        let lat = 35.16587040
        let lng = 129.07284610
        let location = CLLocation(latitude: lat, longitude: lng)
        
//        geoCoder.reverseGeocodeLocation(location, completionHandler: { placemarks, error in
//
//            if error != nil {
//                print(error!)
//            }
//
//            if let myPlacemark = placemarks {
//                let placemark = myPlacemark[0]
//                print(placemark.location!)
//            }
//        })
        
        // trailing closure
        geoCoder.reverseGeocodeLocation(location) { (placemarks: [CLPlacemark]?, error: Error?) in
            if error != nil {
                print("Unable to Reverse Geocodin Location \(error!)")
            }
            
            if let myPlacemark = placemarks {
                let placemark = myPlacemark[0]
                print(placemark)
            }
        }
    }
}

