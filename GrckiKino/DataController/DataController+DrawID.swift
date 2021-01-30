//
//  DataController+DrawID.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/28/21.
//

import Foundation


extension DataController {
    
    func getDrawRound(drawId:Int, completion: @escaping ([Draw]?) -> Void) {
        let endpoint = "/1100/\(drawId)"
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
