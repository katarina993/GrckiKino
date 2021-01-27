//
//  WagerStatistic.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/27/21.
//

import Foundation

class WagerStatistic: Codable {
    
    var columns: Int
    var wagers: Int
    
    init(columns: Int, wagers: Int) {
        self.columns = columns
        self.wagers = wagers        
    }
}
