//
//  StudyLocationsViewController.swift
//  UCSB_Amenities
//
//  Created by Brian Ai on 11/18/21.
//

import UIKit
import Parse

class StudyLocationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

   
    @IBOutlet var tableView: UITableView!
    
    var locations = [PFObject]()
    var selectedLocation: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadLocations()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc func loadLocations() {
        let query = PFQuery(className:"Locations")
        query.includeKeys(["Locations","MapLocation", "Description"])
        query.limit = 20
        //query.order(byDescending: "createdAt")
        
        query.findObjectsInBackground() { (locations, error) in
            if locations != nil {
                self.locations = locations!
                self.tableView.reloadData()
            }
            else {
                print("error loading query", error ?? "error message")
            }
        }
        
       
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let location = locations[indexPath.section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell") as! LocationCell
        
        cell.nameLabel.text = (location["Locations"] as! String)
        cell.locationLabel.text = (location["MapLocation"] as! String)
        cell.detailsLabel.text = (location["Description"] as! String)

        return cell
    }

    // function to logout
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = loginViewController
    }
}
