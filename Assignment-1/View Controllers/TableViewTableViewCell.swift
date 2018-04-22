//
//  TableViewTableViewCell.swift
//  Assignment-1
//
//  Created by Xcode User on 2018-04-21.
//  Copyright © 2018 Jatin Rampal. All rights reserved.
//

import UIKit

class TableViewTableViewCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var fName: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
