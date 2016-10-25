//
//  Main.swift
//  TVWeather
//
//  Created by Mujtaba Alam on 24/10/2016.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

import Foundation
import ObjectMapper

struct Main: Mappable {
    
    var temp: Int!
    var tempMin: Int!
    var tempMax: Int!
    var humidity : Int!
    var pressure : Float!
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        temp <- map["temp"]
        tempMin <- map["temp_min"]
        tempMax <- map["temp_max"]
        humidity <- map["humidity"]
        pressure <- map["pressure"]
    }
}
