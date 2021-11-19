//
//  LoginViewController.swift
//  UCSB_Amenities
//
//  Created by Brian Ai on 11/18/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Navigation
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
  
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user.signUpInBackground {
          (succeeded: Bool, error: Error?) -> Void in
          if let error = error {
              _ = error.localizedDescription
            // Show the errorString somewhere and let the user try again.
              print("Error: \(error.localizedDescription)")
          } else {
            // Hooray! Let them use the app now.
              self.performSegue(withIdentifier: "loginSegue", sender: nil)
          }
        }
    }
    
}
