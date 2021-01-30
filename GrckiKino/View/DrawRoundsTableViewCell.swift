//
//  DrawRoundsTableViewCell.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/27/21.
//

import UIKit

class DrawRoundsTableViewCell: UITableViewCell {

    @IBOutlet weak var drawTimeLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer: Timer?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        timer?.invalidate()
        timer = nil
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    func setupTimer(drawTime: Int){
        timer = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: true) { timer in
            self.timerLabel.text = Utils.timeDiff(drawTime: drawTime)
        }
        timer?.fire()
    }
}
