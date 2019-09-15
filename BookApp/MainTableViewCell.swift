//
//  MainTableViewCell.swift
//  BookApp
//
//  Created by CGL on 13.09.2019.
//  Copyright © 2019 cgl. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likeButtonClicked(_ sender: Any) {
    }
}
