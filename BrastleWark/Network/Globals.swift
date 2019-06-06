//
//  Globals.swift
//  BrastleWark
//
//  Created by Luis Arturo Gutiérrez on 6/6/19.
//  Copyright © 2019 Luis Arturo Gutiérrez. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class Globals {
  
  class func getColor(color: String) -> UIColor {
    switch color {
    case "Pink":
      return Contants.colorPink
    case "Green":
      return Contants.colorGreen
    case "Red":
      return Contants.colorRed
    case "Black":
      return Contants.colorBlack
    case "Gray":
      return Contants.colorGray
      
    default:
      return UIColor(red: 232.0/255.0, green: 35.0/255.0, blue: 139.0/255.0, alpha: 1)
    }
  }
  
  func serializeResponse(withData responseData: String) -> [String:Any]? {
    if responseData.data(using: .utf8) != nil {
      do {
        let data = responseData.data(using: .utf8)
        let jsonData = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]
        return jsonData
      } catch {
        print(error.localizedDescription)
        return nil
      }
    } else {
      return nil
    }
  }
  
  func parseGetGnomes(stringResponse: String, completion: @escaping(_ success: Bool, _ object: Any?) -> Void) {
    guard let dataJSON = serializeResponse(withData: stringResponse) else {
      return completion(false, nil)
    }
    
    guard let responseCode = dataJSON["Brastlewark"] as? [[String: Any]] else{
      return completion(false, nil)
    }
    let arr = Mapper<Gnome>().mapArray(JSONArray: responseCode)
    completion(true,arr)
    
  }
}
struct Contants {
  static let colorPink = UIColor(red: 232.0/255.0, green: 35.0/255.0, blue: 139.0/255.0, alpha: 1)
  static let colorGreen = UIColor(red: 128.0/255.0, green: 229.0/255.0, blue: 73/255.0, alpha: 1)
  static let colorRed = UIColor(red: 352.0/255.0, green: 91.0/255.0, blue: 97.0/255.0, alpha: 1)
  static let colorGray = UIColor.gray
  static let colorBlack = UIColor.black
  
  static let urlRequest = "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json"
}
