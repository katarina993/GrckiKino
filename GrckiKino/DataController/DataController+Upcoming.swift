//
//  DataController+Upcoming.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/27/21.
//

import Foundation

extension DataController {
    
    func getUpcoming(completion: @escaping ([Draw]?) -> Void) {
        let endpoint = "/1100/upcoming/20"
        executeRequest(endpoint: endpoint, method: .get) { (data, statusCode, error) in
            if statusCode == .ok && data != nil {
                let draw = try! JSONDecoder().decode([Draw].self, from: data!)
                completion(draw)
            } else {
                //TODO: handle error
               completion(nil)
            }
        }
    }
    
}
