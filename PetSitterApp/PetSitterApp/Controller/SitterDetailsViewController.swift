//
//  SitterDetailsViewController.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 10/18/21.
//

import UIKit
import AlamofireImage
import Parse

class SitterDetailsViewController: UIViewController {

    @IBOutlet weak var sitterPhoto: UIImageView!
    @IBOutlet weak var sitterName: UILabel!
    @IBOutlet weak var animalTypes: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    var photoURL = URL(string: "www.google.com")!
    var name = ""
    var animals = ""
    var rateString = ""
    var starRating = 5
    var sitter = PFObject(className: "User")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sitterPhoto.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        sitterPhoto.af_setImage(withURL: photoURL)
        sitterPhoto.layer.borderWidth = 2.0
        sitterPhoto.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        sitterPhoto.layer.cornerRadius = sitterPhoto.frame.size.width / 2
        
        sitterName.text = self.name
        animalTypes.text = self.animals
        rate.text = self.rateString
        starImage.image = UIImage(named: "\(starRating)star")

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func alert(message: NSString, title: NSString) {
        let alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertController.Style.alert)
 
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func onBook(_ sender: Any) {
        
        var appointment = PFObject(className:"Appointment")
        
        appointment["owner"] = PFUser.current()
        appointment["sitter"] = self.sitter
        appointment["start"] = NSDate()
        appointment["end"] = NSDate()
        
        appointment.saveInBackground {
          (success: Bool, error: Error?) in
          if (success) {
            self.alert(message: "Your booking has been confirmed." as NSString, title: "Success")
            self.dismiss(animated: true, completion: nil)
          } else {
            self.alert(message: "An error occurred while confirming your booking. Please try again later." as NSString, title: "Oops!")
            print("Error: \(error?.localizedDescription)")
          }
        }
    }
}
