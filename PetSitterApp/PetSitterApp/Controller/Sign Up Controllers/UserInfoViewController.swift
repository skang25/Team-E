//
//  UserInfoViewController.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 10/12/21.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var addressLine1: UITextField!
    @IBOutlet weak var addressLine2: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zipcode: UITextField!
    @IBOutlet weak var birthday: UIDatePicker!
    var userType: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var phone: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var userAddress: String?
        
        if (addressLine2.text != ""){
            userAddress = "\(addressLine1.text!), \(addressLine2.text!), \(city.text!), \(state.text!) \(zipcode.text!)"
        } else {
            userAddress = "\(addressLine1.text!), \(city.text!), \(state.text!) \(zipcode.text!)"
        }
        
        
        let destinationVC = segue.destination as! UserRegisterViewController
        
        destinationVC.userType = self.userType
        destinationVC.firstName = self.firstName
        destinationVC.lastName = self.lastName
        destinationVC.email = self.email
        destinationVC.phone = self.phone
        destinationVC.userAddress = userAddress
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let birthdayString = dateFormatter.string(from: birthday.date)
        destinationVC.userDOB = birthdayString
    }
    

}
