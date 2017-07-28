//
//  DetailsViewController.swift
//  10_TableView_fist
//
//  Created by Ika Javakhishvili on 05/1/17.
//  Copyright © 2017 Ika Javakhishvili. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var text: String!
    var price: String!
    var image: UIImage!
    
    @IBOutlet weak var pictureView: UIImageView!

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pictureView.image = image
        nameLabel.text = text
        priceLabel.text = price

        
    }

    
}
