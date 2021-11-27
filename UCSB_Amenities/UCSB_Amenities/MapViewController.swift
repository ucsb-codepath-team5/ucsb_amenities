//
//  MapViewController.swift
//  UCSB_Amenities
//
//  Created by Brian Ai on 11/26/21.
//

import UIKit
import MapKit


class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var resultSearchController:UISearchController? = nil


    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLocationServices()


        // set the region to display, this also sets a correct zoom level
        // set starting center location in Santa Barbara
        let centerLocation = CLLocation(latitude: 34.4140, longitude: -119.8489)
        goToLocation(location: centerLocation)
        
        
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTable") as! LocationSearchTable
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        
        
        // configures search bar and embeds into navigation bar
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        
        
        resultSearchController?.hidesNavigationBarDuringPresentation = false // search bar accessible at all times
        definesPresentationContext = true // modal overlay will not cover search bar (not working rn)
        
        
        locationSearchTable.mapView = mapView // This passes along a handle of the mapView from the main View Controller onto the locationSearchTable.
        


        
    }
    
    func goToLocation(location: CLLocation) {
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func checkLocationServices() {
      if CLLocationManager.locationServicesEnabled() {
        checkLocationAuthorization()
      } else {
        // Show alert letting the user know they have to turn this on.
      }
    }
    
    // for processing locationManager responses

    func checkLocationAuthorization() {
      switch CLLocationManager.authorizationStatus() {
      case .authorizedWhenInUse:
        mapView.showsUserLocation = true // user will be shown as a blue dot!
       case .denied: // Show alert telling users how to turn on permissions
       break
      case .notDetermined:
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
      case .restricted: // Show an alert letting them know what’s up
       break
      case .authorizedAlways:
       break
      @unknown default:
          print("fatal error")
      }
    }

}


