//
//  RequestCell.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 11/22/21.
//

import UIKit
import Parse

class RequestCell: UITableViewCell {
    
    
    @IBOutlet weak var ownerProfilePic: UIImageView!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var petNames: UILabel!
    @IBOutlet weak var dates: UILabel!
    
    var requests = [PFObject]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getIndexPath() -> IndexPath? {
        guard let superView = self.superview as? UITableView else {
            print("superview is not a UITableView - getIndexPath")
            return nil
        }
        let indexPath = superView.indexPath(for: self)!
        return indexPath
    }
    
    
    @IBAction func onAccept(_ sender: Any) {
        
        // 1. Locate request object
        let indexPath = self.getIndexPath()
        let req = self.requests[indexPath!.row]
        
        // 2. Create new Appointment object with matching attributes
        
        let appt = PFObject(className:"Appointment")
        
        appt["owner"] = req["owner"]
        appt["sitter"] = req["sitter"]
        appt["start"] = req["start"]
        appt["end"] = req["end"]
        
        appt.saveInBackground {
          (success: Bool, error: Error?) in
          if (success) {
            print("approved")
          } else {
            print("Error: \(error?.localizedDescription)")
          }
        }
        
        // 3. Delete current Request object --> NOT SURE IF THIS IS CORRECT SYNTAX
        req.deleteInBackground()
 
        print("Accepted")
    }
    
    @IBAction func onDecline(_ sender: Any) {
        
        // 1. Locate request object
        let indexPath = self.getIndexPath()
        let req = self.requests[indexPath!.row]
        
        // 2. Delete current Request object --> NOT SURE IF THIS IS CORRECT SYNTAX
        req.deleteInBackground()
        
        print("Declined")
    }
}
