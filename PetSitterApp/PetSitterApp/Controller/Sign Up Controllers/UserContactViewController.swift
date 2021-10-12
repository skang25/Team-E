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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onContinue(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("preparing")
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
