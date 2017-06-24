//
//  MyTableViewCell.swift
//  CustomTableViewProject
//
//  Created by Woodland on 6/13/17.
//  Copyright © 2017 MikeWoodland. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var destImage: UIImageView!
    @IBOutlet weak var destLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
