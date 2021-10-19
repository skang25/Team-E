//
//  UserHomeScreenTableViewCell.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 10/12/21.
//

import UIKit

class UserHomeScreenTableViewCell: UITableViewCell {

    @IBOutlet weak var sitterProfilePic: UIImageView!
    @IBOutlet weak var sitterName: UILabel!
    @IBOutlet weak var animalTypes: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
