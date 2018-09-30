//
//  Campus Map.swift
//  Tafe Buddy
//
//  Created by Ti Chuot on 7/4/17.
//  Copyright © 2017 Ti Chuot. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CampusMap: UIViewController {
    @IBOutlet weak var map: MKMapView!
    
   
    var detailItem: CampusDetails? {
        didSet {
            // Update the view.
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let detail:CampusDetails = self.detailItem!
        let location = CLLocationCoordinate2DMake(detail.latitude, detail.longtitude)
        let span = MKCoordinateSpanMake(0.02, 0.02)
        let region = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = detail.title
        annotation.subtitle = detail.subTitle
        map.addAnnotation(annotation)
        
        //Showing the device location on the map
        self.map.showsUserLocation = true
    }

}
