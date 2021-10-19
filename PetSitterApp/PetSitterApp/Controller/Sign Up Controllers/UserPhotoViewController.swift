//
//  UserPhotoViewController.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 10/12/21.
//

import UIKit

class UserPhotoViewController: UIViewController {

    @IBOutlet weak var profilePic: UIImageView!
    var userType: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var phone: String?
    var userAddress: String?
    var userDOB: String?
    var username: String?
    var password: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profilePic.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        profilePic.layer.borderWidth = 2.0
        profilePic.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        profilePic.layer.cornerRadius = profilePic.frame.size.width / 2
    }
    
    @IBAction func onUploadPhoto(_ sender: Any) {
        //TO-DO: Import AlamofireImage
    }
    
    @IBAction func onFinish(_ sender: Any) {
        //Send info to database
    }
    

}
