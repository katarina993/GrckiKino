//
//  DataController+Results.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/30/21.
//

import Foundation

extension DataController {
    
    func getResult(dateFrom:String, dateTo:String,completion: @escaping ([DrawResultContent]?) -> Void) {
        let endpoint = "/1100/draw-date/\(dateFrom)/\(dateTo)"
        executeRequest(endpoint: endpoint, method: .get) { (data, statusCode, error) in
            if statusCode == .ok && data != nil {
                let draw = try! JSONDecoder().decode(DrawResult.self, from: data!)
                let content = draw.content
                completion(content)
            } else {
                //TODO: handle error
               completion(nil)
            }
        }
    }
   
    
}

