//
//  Temperature.swift
//  Weather
//
//  Created by Mujtaba Alam on 24/10/2016.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

import Foundation
import ObjectMapper

class Temperature: Mappable {

    var dt : Int!
    var id : Int!
    var name : String!
    
    var main: Main!
    var sys : Sys!
    var weather : [Weather]!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        dt <- map["dt"]
        id <- map["id"]
        name <- map["name"]
        main <- map["main"]
        sys <- map["sys"]
        weather <- map["weather"]
    }
}
