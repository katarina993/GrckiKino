//
//  ResultResponse.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/30/21.
//

import Foundation

class DrawResult: Codable {
    var content: [DrawResultContent]?
    var totalPages: Int
    var totalElements: Int
    var last: Bool
    var numberOfElements: Int
    var sort: [Sort]?
    var first: Bool
    var size: Int
    var number: Int
    
    
    init(content: [DrawResultContent]?, totalPages: Int, totalElements: Int, last: Bool, numberOfElements: Int, sort: [Sort]?, first: Bool, size: Int, number: Int) {
        self.content = content
        self.totalPages = totalPages
        self.totalElements = totalElements
        self.last = last
        self.numberOfElements = numberOfElements
        self.sort = sort
        self.first = first
        self.size = size
        self.number = number
    }
    
}
