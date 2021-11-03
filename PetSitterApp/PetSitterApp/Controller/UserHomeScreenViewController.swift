//
//  UserHomeScreenViewController.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 10/12/21.
//

import UIKit
import Parse

class UserHomeScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var petSitters = [PFObject]()
    
    var photoFile = PFUser.current()?["profileImage"]
    var name = ""
    var animalTypes = "Dogs, Cats"
    var rate = ""
    var starRate = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.loadSitters()

        // Do any additional setup after loading the view.
    }
    
    @objc override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadSitters()
    }
    
    @objc func loadSitters() {
        let query = PFUser.query()
        query?.includeKeys(["firstName", "lastName", "profileImage", "rate", "goodWith", "starRating"])
        query?.whereKey("userType", equalTo: "sitter")

        query?.findObjectsInBackground { (users, error) in
            if users != nil {
                self.petSitters = users!
                self.tableView.reloadData()
            }
            else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.petSitters.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sitter = self.petSitters[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sitterCell", for: indexPath) as! UserHomeScreenTableViewCell
        
        if (sitter["profileImage"] != nil) {
            let imageFile = sitter["profileImage"] as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
            cell.sitterProfilePic.af_setImage(withURL: url)
        }
        
        cell.sitterProfilePic.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.sitterProfilePic.layer.borderWidth = 1.0
        cell.sitterProfilePic.layer.cornerRadius = cell.sitterProfilePic.frame.size.width / 2
        
        cell.sitterName.text = "\(sitter["firstName"]!) \(sitter["lastName"]!)"
        
        cell.sitterRate.text = "$\(sitter["rate"]!)/hr"
        
        let rating = sitter["starRating"] as! Int
        cell.starRating.image = UIImage(named: "\(rating)star")
        
        return cell
        
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navVC = segue.destination as! UINavigationController
        let destVC = navVC.viewControllers[0] as! SitterDetailsViewController
        let imageFile = self.photoFile as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        destVC.photoURL = url
        destVC.name = self.name
        destVC.animals = self.animalTypes
        destVC.rateString = self.rate
        destVC.starRating = self.starRate
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sitter = self.petSitters[indexPath.row]
        self.photoFile = sitter["profileImage"] as! PFFileObject
        self.name = "\(sitter["firstName"]!) \(sitter["lastName"]!)"
        self.rate = "$\(sitter["rate"]!)/hr"
        self.starRate = sitter["starRating"] as! Int
        //self.animalTypes
        self.performSegue(withIdentifier: "sitterDetails", sender: nil)
    }
    
    
    @IBAction func onLogout(_ sender: Any) {
        
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = main.instantiateViewController(withIdentifier: "LoginViewController")
        let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        delegate.window?.rootViewController = loginVC

    }
    
}
