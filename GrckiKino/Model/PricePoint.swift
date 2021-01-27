//
//  PricePoint.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/27/21.
//

import Foundation

class PricePoint: Codable {
    
    var addOn: [AddOn]?
    var amount: Double?
    
    init(addOn:[AddOn]?, amount: Double?) {
        self.addOn = addOn
        self.amount = amount
    }
}
