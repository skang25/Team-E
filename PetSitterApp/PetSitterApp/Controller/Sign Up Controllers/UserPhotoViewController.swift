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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onUploadPhoto(_ sender: Any) {
    }
    
    @IBAction func onFinish(_ sender: Any) {
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
