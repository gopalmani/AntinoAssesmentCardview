//
//  UserCell.swift
//  AntinoAssesmentCardview
//
//  Created by Gopal Mani Dubey on 15/11/19.
//  Copyright © 2019 Gopal Mani. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
