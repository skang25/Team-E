//
//  LoginViewController.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 10/12/21.
//

import UIKit

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
    

    @IBAction func onLogin(_ sender: Any) {
        
    }
    

}
