//
//  myTableViewCell.swift
//  10_TableView_fist
//
//  Created by Ika Javakhishvili on 05/1/17.
//  Copyright © 2017 Ika Javakhishvili. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var pictureView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }


}
