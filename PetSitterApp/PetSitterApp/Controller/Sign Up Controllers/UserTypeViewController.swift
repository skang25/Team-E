//
//  UserTypeViewController.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 10/12/21.
//

import UIKit

class UserTypeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! UserNameViewController
        
        if segue.identifier == "ownerToName" {
            destinationVC.userType = "owner"
            print("here")
        }
        
        if segue.identifier == "sitterToName" {
            destinationVC.userType = "sitter"
        }
        
    }


}
