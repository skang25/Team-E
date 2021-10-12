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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onContinue(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("preparing")
    }
    

}
