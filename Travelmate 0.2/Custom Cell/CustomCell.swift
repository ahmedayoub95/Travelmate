//
//  CustomCell.swift
//  Travelmate 0.2
//
//  Created by Muhammad on 15/02/2020.
//  Copyright © 2020 Saami. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet var senderName: UILabel!
    @IBOutlet var messageBody: UILabel!
    @IBOutlet var messageBackground: UIView!
    @IBOutlet var displayPicture: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
