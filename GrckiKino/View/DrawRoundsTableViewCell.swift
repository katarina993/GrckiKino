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
            self.timerLabel.text = self.timeDiff(drawTime: drawTime)
        }
        timer?.fire()
    }
    
    
    func timeDiff(drawTime: Int) -> String {
        let currentDate = Date()
        let epochTime = TimeInterval(drawTime) / 1000
        let drawDate = Date(timeIntervalSince1970: epochTime)
        let dateTimeDiff = drawDate.timeIntervalSince(currentDate)
        if dateTimeDiff <= 0 {
            return "EXPIRED"
        }
        return stringFromTimeInterval(interval:dateTimeDiff)
    }
    
    func stringFromTimeInterval(interval: Double) -> String {
        let hours = (Int(interval) / 3600)
        let minutes = Int(interval / 60) - Int(hours * 60)
        let seconds = Int(interval) - (Int(interval / 60) * 60)
        return String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
    }
}
