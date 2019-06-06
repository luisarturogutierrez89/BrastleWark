//
//  ServiceManager.swift
//  BrastleWark
//
//  Created by Luis Arturo Gutiérrez on 6/6/19.
//  Copyright © 2019 Luis Arturo Gutiérrez. All rights reserved.
//

import Foundation

class ServiceManager {
  private let response = Globals()
  
  func initWithURl(completion: @escaping(_ success: Bool, _ object: Any?) -> Void) {
    
    let request = NSMutableURLRequest(url: NSURL(string: Contants.urlRequest)! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 15.0)
    request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "GET"
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
      if (error != nil) {
        completion(false, nil)
      } else {
        let dataString = String(data: data!, encoding: String.Encoding.utf8)
        self.response.parseGetGnomes(stringResponse: dataString!, completion: completion)
        
      }
    })
    dataTask.resume()
  }
}
