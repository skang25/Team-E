//
//  UserRegisterViewController.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 10/12/21.
//

import UIKit

class UserRegisterViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordRetype: UITextField!
    
    var userType: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var phone: String?
    var userAddress: String?
    var userDOB: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! UserPhotoViewController
        
        destinationVC.userType = self.userType
        destinationVC.firstName = self.firstName
        destinationVC.lastName = self.lastName
        destinationVC.email = self.email
        destinationVC.phone = self.phone
        destinationVC.userAddress = self.userAddress
        destinationVC.userDOB = self.userDOB
        destinationVC.username = username.text
        destinationVC.password = password.text
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
