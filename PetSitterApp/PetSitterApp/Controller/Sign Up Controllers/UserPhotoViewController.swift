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

        profilePic.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
