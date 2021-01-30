//
//  Utils.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/29/21.
//

import Foundation


class Utils {
    static func timeDiff(drawTime: Int) -> String {
        let currentDate = Date()
        let epochTime = TimeInterval(drawTime) / 1000
        let drawDate = Date(timeIntervalSince1970: epochTime)
        let dateTimeDiff = drawDate.timeIntervalSince(currentDate)
        if dateTimeDiff <= 0 {
            return "EXPIRED"
        }
        return stringFromTimeInterval(interval:dateTimeDiff)
    }

    static func stringFromTimeInterval(interval: Double) -> String {
        let hours = (Int(interval) / 3600)
        let minutes = Int(interval / 60) - Int(hours * 60)
        let seconds = Int(interval) - (Int(interval / 60) * 60)
        return String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
    }
}
