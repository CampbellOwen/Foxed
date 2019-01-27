//
//  GameCell.swift
//  Foxed
//
//  Created by Owen Campbell on 2019-01-27.
//  Copyright © 2019 Owen Campbell. All rights reserved.
//

import UIKit

class GameCell: UICollectionViewCell {

    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func populate(with game: Game) {
        gameImage.image = UIImage(named: game.imageName)
        gameDescription.text = game.description
    }

}
