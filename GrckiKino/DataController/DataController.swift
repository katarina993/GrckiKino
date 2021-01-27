//
//  DataController.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/27/21.
//

import Foundation

let baseUrl = "https://api.opap.gr/draws/v3.0"

enum HTTPMethod: String {
  case get = "GET"
  case post = "PUT"
}

enum HTTPStatusCode {
  case ok
  case badRequest
  case unauthorized
  case tooManyRequests
  case serverError
  case unKnown
  
  init(statusCode: Int) {
    switch statusCode {
    case 200:
      self = .ok
    case 400:
      self = .badRequest
    case 401:
      self = .unauthorized
    case 429:
      self = .tooManyRequests
    case 500:
      self = .serverError
    default:
      self = .unKnown
    }
  }
}

class DataController {
    
    static let shared = DataController()
    private init() {}
    
    func executeRequest(endpoint: String,
                      method: HTTPMethod,
                      body: Data? = nil,
                      completion: @escaping (Data?, HTTPStatusCode, Error?) -> Void)
    {
        if let url = URL(string: baseUrl + endpoint) {
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            request.httpBody = body
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                let statusCode = (response as! HTTPURLResponse).statusCode
                
                #if DEBUG
                if data != nil {
                    if let logMessage = String(data: data!, encoding: .utf8) {
                        NSLog("Requested: \(endpoint)")
                        NSLog("Status code: \(statusCode)")
                        NSLog("Response: \(logMessage)")
                    }
                }
                #endif
                let httpStatusCode = HTTPStatusCode(statusCode: statusCode)
                completion(data, httpStatusCode, error)
                
            }
            dataTask.resume()
        }
        
    }
    
}
