//
//  DrawResponse.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/30/21.
//

import Foundation

class DrawResultContent: Codable {
    
    var gameId: Int?
    var drawId: Int?
    var drawTime: Int
    var status: String?
    var drawBreak: Int?
    var visualDraw: Int?
    var pricePoints: PricePoint?
    var winningNumbers: WinningNumber
    var prizeCategories: [PrizeCategory]?
    
    init(gameId: Int?, drawId: Int?, drawTime: Int, status: String, drawBreak: Int, visualDraw: Int, pricePoints: PricePoint?, prizeCategories:[PrizeCategory]?, winningNumbers:WinningNumber) {
        self.gameId = gameId
        self.drawId = drawId
        self.drawTime = drawTime
        self.status = status
        self.drawBreak = drawBreak
        self.visualDraw = visualDraw
        self.pricePoints = pricePoints
        self.prizeCategories = prizeCategories
        self.winningNumbers = winningNumbers
    }
    
    func getDrawTimeFormatted() -> String {
        let epochTime = TimeInterval(drawTime) / 1000
        let date = Date(timeIntervalSince1970: epochTime)
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "HH:mm"
        let dateStr = formatter.string(from: date)
        return dateStr
    }
}
