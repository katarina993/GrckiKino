//
//  WinningNumber.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/30/21.
//

import Foundation

class WinningNumber: Codable {
    
    var list: [Int]
    var bonus: [Int]?
    var sidebets: Slidebet?
    
    init(list: [Int], bonus: [Int]?, sidebets: Slidebet?) {
        self.list = list
        self.bonus = bonus
        self.sidebets = sidebets
    }
}
