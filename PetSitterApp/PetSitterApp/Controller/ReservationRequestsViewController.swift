//
//  ReservationRequestsViewController.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 11/22/21.
//

import UIKit
import Parse

class ReservationRequestsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var requests = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadRequests()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadRequests()
    }
    
    func loadRequests() {
        let query = PFQuery(className:"Request")
        query.includeKeys(["owner", "sitter", "start", "end"])
        query.whereKey("sitter", equalTo: PFUser.current())

        query.findObjectsInBackground { (reqs, error) in
            if reqs != nil {
                self.requests = reqs!
                self.tableView.reloadData()
            }
            else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "requestCell") as! RequestCell
        
        let booking = self.requests[indexPath.row]
        let user = PFUser.current()
        
        let owner = booking["owner"] as! PFObject
        let ownerFName = owner["firstName"] as! String
        let ownerLName = owner["lastName"] as! String
        cell.ownerName.text = ownerFName + " " + ownerLName
        
        if (owner["profileImage"] != nil) {
            let imageFile = owner["profileImage"] as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
            cell.ownerProfilePic.af_setImage(withURL: url)
        }
        
        let formatter = DateFormatter()
//        formatter.dateFormat = "MM/dd/yyyy HH:mm"
        formatter.dateFormat = "MM-dd-yyyy"
        let startString = formatter.string(from: (booking["start"] as! NSDate) as Date)
        let endString = formatter.string(from: (booking["end"] as! NSDate) as Date)
        cell.dates.text = "\(startString) - \(endString)"
        
        cell.petNames.text = "Pets: Morty, Minerva"
        cell.requests = self.requests
        
        return cell
    }

    // HAVE NOT TESTED
    @IBAction func approveAll(_ sender: Any) {
                
        // For each request
        //  - Create new Appointment object
        //  - Delete Request object
                
        for req in requests {
            
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
            
        }
    
        print("Approved All")
    }
}
