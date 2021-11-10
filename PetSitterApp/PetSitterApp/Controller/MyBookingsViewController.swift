//
//  MyBookingsViewController.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 11/10/21.
//

import UIKit
import Parse

class MyBookingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var appointments = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        loadAppointments()

    }
    
    @objc func loadAppointments() {
        let query = PFQuery(className:"Appointment")
        query.includeKeys(["owner", "sitter", "start", "end"])
        query.whereKey("owner", equalTo: PFUser.current())

        query.findObjectsInBackground { (appts, error) in
            if appts != nil {
                self.appointments = appts!
                self.tableView.reloadData()
            }
            else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.appointments.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookingCell") as! BookingCell
        
        let booking = self.appointments[indexPath.row]
        let sitter = booking["sitter"]
        
        return cell
    }

}
