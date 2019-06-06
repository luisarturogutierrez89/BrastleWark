//
//  Gnome.swift
//  BrastleWark
//
//  Created by Luis Arturo Gutiérrez on 6/6/19.
//  Copyright © 2019 Luis Arturo Gutiérrez. All rights reserved.
//

import Foundation
import ObjectMapper

class Gnome: Mappable {
  
  var id: Int?
  var name: String?
  var age: Int?
  var thumbnail: String?
  var weight: Int?
  var height: Int?
  var hair_color: String?
  var professions = [String]()
  var friends = [String]()
  init(){}
  
  required init?(map: Map){
  }
  
  func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    age <- map["age"]
    thumbnail <- map["thumbnail"]
    weight <- map["weight"]
    height <- map["height"]
    hair_color <- map["hair_color"]
    professions <- map["professions"]
    friends <- map["friends"]
  }
}
