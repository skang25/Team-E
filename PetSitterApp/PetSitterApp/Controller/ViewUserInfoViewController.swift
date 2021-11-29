//
//  ViewUserInfoViewController.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 10/19/21.
//

import UIKit
import Parse
import AlamofireImage
import CryptoKit

class ViewUserInfoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    

    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var petCollectionView: UICollectionView!
    @IBOutlet var name: UILabel!
    var pets = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = PFUser.current()
        
        petCollectionView.delegate = self
        petCollectionView.dataSource = self
        print(user!)
        if user!["profileImage"] != nil {
            let imageFile = user!["profileImage"] as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
            userPhoto.af_setImage(withURL: url)
        }
        
        userPhoto.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        userPhoto.layer.borderWidth = 2.0
        userPhoto.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        userPhoto.layer.cornerRadius = userPhoto.frame.size.width / 2
        
        
        let fName = user!["firstName"] as! String
        let lName = user!["lastName"] as! String
        name.text = fName + " " + lName
        
        loadPets()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadPets()
        
        let user = PFUser.current()
        
        if user!["profileImage"] != nil {
            let imageFile = user!["profileImage"] as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
            userPhoto.af_setImage(withURL: url)
        }
    }
    
    func loadPets() {
        
        let query = PFQuery(className: "Pet")
        query.order(byDescending: "createdAt")
        query.whereKey("owner", equalTo: PFUser.current())
        
        query.findObjectsInBackground { (pets, error) in
            if pets != nil {
                self.pets = pets!
                print(self.pets)
                //self.posts.append(contentsOf: posts!)
                self.petCollectionView.reloadData()
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("here")
        let cell = petCollectionView.dequeueReusableCell(withReuseIdentifier: "petCell", for: indexPath) as! PetCollectionViewCell
        
        let pet = self.pets[indexPath.row]
        print(pet)
        if pet["image"] != nil {
            let imageFile = pet["image"] as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
            cell.petPhoto.af_setImage(withURL: url)
        }
        cell.petPhoto.layer.borderWidth = 2.0
        cell.petPhoto.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.petPhoto.layer.cornerRadius = 0.5 * cell.petPhoto.frame.size.width
        
        return cell
    }

    @IBAction func editPhoto(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 200, height: 200)
        let scaledImage = image.af_imageAspectScaled(toFill: size)
        
        userPhoto.image = scaledImage
        
        let user = PFUser.current()
        let imageTemp = userPhoto.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageTemp!)
        user!["profileImage"] = file
        user!.saveInBackground()
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
