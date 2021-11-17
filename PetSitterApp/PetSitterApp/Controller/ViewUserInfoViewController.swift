//
//  ViewUserInfoViewController.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 10/19/21.
//

import UIKit
import Parse
import CryptoKit

class ViewUserInfoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var petCollectionView: UICollectionView!
    @IBOutlet var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        petCollectionView.delegate = self
        petCollectionView.dataSource = self
        
        userPhoto.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        userPhoto.layer.borderWidth = 2.0
        userPhoto.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        userPhoto.layer.cornerRadius = userPhoto.frame.size.width / 2
        
        petCollectionView.reloadData()
        
        // Do any additional setup after loading the view.
        /*
        let query = PFQuery(className: "_User")
        query.getObjectInBackground(withId: "Pwbe4GaXds") { (object, error) -> Void in
            if object != nil && error == nil {
                //Successfully retrieved
                    print(object!["lastname"] as! String)
            }
            else{
                // Some error happened
            }
        }*/
        
//        let query = PFQuery(className: "_User")
//        query.findObjectsInBackground { [self] (objects, error) -> Void in
//            if error == nil {
//                if let returnedobjects = objects {
//                    for object in returnedobjects {
//                        if((object["firstName"] as! String) == "Sam"){
//                            Firstname.text = "Sam"
//                        }
//                    }
//                }
//            }
//        }
        
        let user = PFUser.current()
        let fName = user!["firstName"] as! String
        let lName = user!["lastName"] as! String
        name.text = fName + " " + lName
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("3")
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("here")
        let cell = petCollectionView.dequeueReusableCell(withReuseIdentifier: "petCell", for: indexPath) as! PetCollectionViewCell
        
        cell.petPhoto.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        cell.petPhoto.layer.borderWidth = 2.0
        cell.petPhoto.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.petPhoto.layer.cornerRadius = 0.5 * cell.petPhoto.frame.size.width
        
        return cell
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
