//
//  PrizeCategory.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/27/21.
//

import Foundation

class PrizeCategory: Codable {
    
    var id: Int?
    var divident: Double
    var winners: Int?
    var distributed: Double
    var jackpot: Double
    var fixed: Double
    var categoryType: Int?
    var gameType: String
    
    init(id: Int?, divident: Double, winners: Int?, distributed: Double, jackpot: Double, fixed: Double, categoryType:Int?, gameType: String) {
        self.id = id
        self.divident = divident
        self.winners = winners
        self.distributed = distributed
        self.jackpot = jackpot
        self.fixed = fixed
        self.categoryType = categoryType
        self.gameType = gameType
    
    }
    
}
