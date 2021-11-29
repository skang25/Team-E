//
//  AddPetViewController.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 11/29/21.
//

import UIKit
import AlamofireImage
import Parse

class AddPetViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var animalType: UISegmentedControl!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var breed: UITextField!
    var type = "Cat"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        image.layer.cornerRadius = image.frame.height/2
        breed.isHidden = true
        breedLabel.isHidden = true

    }

    @IBAction func uploadImage(_ sender: Any) {
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
        
        let size = CGSize(width: 210, height: 210)
        let scaledImage = image.af_imageAspectScaled(toFill: size)
        
        self.image.image = scaledImage
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func chooseAnimalType(_ sender: Any) {
        
        switch animalType.selectedSegmentIndex
            {
            case 0:
                breed.isHidden = true
                breedLabel.isHidden = true
                type = "Cat"
            case 1:
                breed.isHidden = false
                breedLabel.isHidden = false
                type = "Dog"
            default:
                break
            }
    }
    
    @IBAction func addPet(_ sender: Any) {
        
        let pet = PFObject(className: "Pet")
        
        pet["petName"] = name.text
        pet["petType"] = type
        pet["breed"] = breed.text ?? " "
        pet["age"] = Int(age.text!)
        pet["owner"] = PFUser.current()
        
        let imageTemp = self.image.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageTemp!)
        pet["image"] = file
        
        pet.saveInBackground {
          (success: Bool, error: Error?) in
          if (success) {
            print("Pet saved!")
            self.dismiss(animated: true, completion: nil)
          } else {
            print("Error: \(error?.localizedDescription)")
          }
        }
        
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
