//
//  UserContactViewController.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 10/12/21.
//

import UIKit

class UserContactViewController: UIViewController {

    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var niceToMeetLabel: UILabel!
    var userType: String?
    var firstName: String?
    var lastName: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        niceToMeetLabel.text = "Nice to meet you, \(firstName!)!"

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! UserInfoViewController
        
        destinationVC.userType = self.userType
        destinationVC.firstName = self.firstName
        destinationVC.lastName = self.lastName
        destinationVC.email = emailAddress.text
        destinationVC.phone = phoneNumber.text
        
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
