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
    
    override func viewDidAppear(_ animated: Bool) {
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
        let sitter = booking["sitter"] as! PFObject
        let sitterFName = sitter["firstName"] as! String
        let sitterLName = sitter["lastName"] as! String
        print("Sitter is: \(sitter)")
        
        cell.sitterName.text = sitterFName + " " + sitterLName
        
        let formatter = DateFormatter()
//        formatter.dateFormat = "MM/dd/yyyy HH:mm"
        formatter.dateFormat = "MM-dd-yyyy"
        let myString = formatter.string(from: (booking["start"] as! NSDate) as Date)
        cell.startDate.text = myString
        
        if (sitter["profileImage"] != nil) {
            let imageFile = sitter["profileImage"] as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
            cell.sitterPhoto.af_setImage(withURL: url)
        }
        
        cell.petNames.text = "Morty, Minerva"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}
