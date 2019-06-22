//
//  AddLocationVC.swift
//  OnTheMap
//
//  Created by Azza on 6/21/19.
//  Copyright © 2019 Azza. All rights reserved.
//

import UIKit
import CoreLocation

class AddLocationVC: UIViewController {
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var linkTextField: UITextField!
    @IBOutlet weak var findLocationButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var coordinate: CLLocationCoordinate2D?
    var linkString = ""
    var mapString = ""
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.hidesBottomBarWhenPushed = true
        interfaceConfiguration(spin: false)
    }
    
    func interfaceConfiguration(spin: Bool) {
        switch spin {
        case true:
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        case false:
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == MapConstant.displayMapSegueId {
            let vc = segue.destination as! AddLocationMapVC
            vc.coordinate = coordinate
            vc.linkString = linkString
            vc.mapString = mapString
        }
        interfaceConfiguration(spin: false)
    }
    
    /// find the geocode via addressString and segue to AddLocationMap view controller
    ///
    /// - Parameter sender: find location button
    @IBAction func findLocation(_ sender: Any) {
        interfaceConfiguration(spin: true)
        let geocoder = CLGeocoder()
        mapString = locationTextField.text ?? ""
        let locationString = locationTextField.text ?? ""
        geocoder.geocodeAddressString(locationString) { (placemark, error) in
            guard let error = error else {
                self.coordinate = placemark?.first?.location?.coordinate
                self.linkString = self.linkTextField.text ?? ""
                self.interfaceConfiguration(spin: false)
                self.performSegue(withIdentifier: MapConstant.displayMapSegueId, sender: self)
                return
            }
            self.displayAlert(error)
            return
        }
    }
}






