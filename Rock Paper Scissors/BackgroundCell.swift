//
//  BackgroundCell.swift
//  Rock Paper Scissors
//
//  Created by Matt Luke on 10/18/19.
//  Copyright © 2019 MlukeApps. All rights reserved.
//

import UIKit

class BackgroundCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var buttonView: UIView!
    
    var image: UIImage = #imageLiteral(resourceName: "blue")
    
    
    
    var backgroundChoice = "Background One" {
        didSet{
            image = UIImage(named: backgroundChoice) ?? #imageLiteral(resourceName: "blue")
            backgroundImage.image = image
            buttonView.layer.cornerRadius = 20
        }
    }
}
