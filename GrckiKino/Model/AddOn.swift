//
//  AddOn.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/27/21.
//

import Foundation

class AddOn: Codable {
    
    var amount: Double?
    var gameType: String?
    
    init(amount: Double?, gameType: String?) {
      self.amount = amount
      self.gameType = gameType
    }
}
