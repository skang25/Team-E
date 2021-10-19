//
//  SitterDetailsViewController.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 10/18/21.
//

import UIKit

class SitterDetailsViewController: UIViewController {

    @IBOutlet weak var sitterPhoto: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sitterPhoto.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        sitterPhoto.layer.borderWidth = 2.0
        sitterPhoto.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        sitterPhoto.layer.cornerRadius = sitterPhoto.frame.size.width / 2

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
