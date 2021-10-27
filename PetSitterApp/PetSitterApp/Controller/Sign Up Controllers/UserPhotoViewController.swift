//
//  UserPhotoViewController.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 10/12/21.
//

import UIKit
import AlamofireImage
import Parse

class UserPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profilePic: UIImageView!
    var userType: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var phone: String?
    var userAddress: String?
    var userDOB: String?
    var username: String?
    var password: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profilePic.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        profilePic.layer.borderWidth = 2.0
        profilePic.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        profilePic.layer.cornerRadius = profilePic.frame.size.width / 2
    }
    
    @IBAction func onUploadPhoto(_ sender: Any) {
        
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
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af.imageAspectScaled(toFill: size)
        
        profilePic.image = scaledImage
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func onFinish(_ sender: Any) {
        
        let user = PFUser()
        user.username = self.username
        user.password = self.password
        user["userType"] = self.userType
        user["firstName"] = self.firstName
        user["lastName"] = self.lastName
        user["email"] = self.email
        user["phoneNumber"] = self.phone
        user["address"] = self.userAddress
        
        let image = profilePic.image!.pngData()
        let file = PFFileObject(name: "image.png", data: image!)
        user["profileImage"] = file

//        var userDOB: String?
        
        user.signUpInBackground { (success, error) in
            if success {
                // if self.userType == "owner"
                self.performSegue(withIdentifier: "userHome", sender: nil)
                //else {
                //self.performSegue(withIdentifier: "sitterHome", sender: nil)
                //}
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
        
    }
    

}
