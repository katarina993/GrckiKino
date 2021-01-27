//
//  Draw.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/27/21.
//

import Foundation

class Draw: Codable {
    
    var gameID: Int?
    var drawID: Int?
    var drawTime: Int
    var status: String
    var drawBreak: Int
    var visualDraw: Int
    var pricePoints: PricePoint?
    var prizeCategories: [PrizeCategory]?
    var wagerStatistics: WagerStatistic
    
    init(gameID: Int?, drawID: Int?, drawTime: Int, status: String, drawBreak: Int, visualDraw: Int, pricePoints: PricePoint?, prizeCategories:[PrizeCategory]?, wagerStatistics:WagerStatistic) {
        self.gameID = gameID
        self.drawID = drawID
        self.drawTime = drawTime
        self.status = status
        self.drawBreak = drawBreak
        self.visualDraw = visualDraw
        self.pricePoints = pricePoints
        self.prizeCategories = prizeCategories
        self.wagerStatistics = wagerStatistics
    }
    
    func getDrawTimeFormatted() -> String{
        let epochTime = TimeInterval(drawTime) / 1000
        let date = Date(timeIntervalSince1970: epochTime)
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "HH:mm"
        let dateStr = formatter.string(from: date)
        print(dateStr)
        return dateStr
    }
}
