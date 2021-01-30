//
//  SecondCellCollectionViewCell.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/28/21.
//

import UIKit

class GameRoundCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var circleBackgroundView: Circle!
    
    func setSelected(selected: Bool) {
        if selected {
            self.circleBackgroundView.isHidden = false            
        }
        else{
            self.circleBackgroundView.isHidden = true
        }
    }
}

