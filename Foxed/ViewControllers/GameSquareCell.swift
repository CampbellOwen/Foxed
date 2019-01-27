//
//  GameSquareCell.swift
//  Foxed
//
//  Created by Owen Campbell on 2019-01-26.
//  Copyright © 2019 Owen Campbell. All rights reserved.
//

import UIKit

class GameSquareCell: UICollectionViewCell {
    
    @IBOutlet weak var gameDescription: UILabel!
    
    func populate(with model: Game) {
        gameDescription.text = model.description
    }
}
