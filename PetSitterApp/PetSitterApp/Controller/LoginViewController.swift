//
//  LoginViewController.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 10/12/21.
//

import UIKit
import Parse
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoImage.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        logoImage.layer.borderWidth = 2.0
        logoImage.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        logoImage.layer.cornerRadius = logoImage.frame.size.width / 2

        // Do any additional setup after loading the view.
    }
    
    func alert(message: NSString, title: NSString) {
        let alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertController.Style.alert)
 
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)); self.present(alert, animated: true, completion: nil)
        
    }
    

    @IBAction func onLogin(_ sender: Any) {
        
        let username = self.usernameField.text
        let password = self.passwordField.text
        
        PFUser.logInWithUsername(inBackground: username!, password: password!, block: {(user, error) -> Void in
            if let error = error as NSError? {
                let errorString = error.userInfo["error"] as? NSString
                self.alert(message: errorString!, title: "Error")
            }
            else {
                self.performSegue(withIdentifier: "login", sender: nil)
                //self.alert(message: "Welcome back!", title: "Login")
            }
        })
        
    }
    
    
}
