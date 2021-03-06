//
//  BookingCell.swift
//  PetSitterApp
//
//  Created by Alexis Edwards on 11/10/21.
//

import UIKit

class BookingCell: UITableViewCell {
    
    
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var petNames: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
