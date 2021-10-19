//
//  UserHomeScreenViewController.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 10/12/21.
//

import UIKit

class UserHomeScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sitterCell", for: indexPath) as! UserHomeScreenTableViewCell
        
        cell.sitterProfilePic.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.sitterProfilePic.layer.borderWidth = 1.0
        cell.sitterProfilePic.layer.cornerRadius = cell.sitterProfilePic.frame.size.width / 2
        
        return cell
        
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "sitterDetails", sender: nil)
    }
    
    
    @IBAction func onLogout(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
