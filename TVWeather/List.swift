//
//  TempList.swift
//  Weather
//
//  Created by Mujtaba Alam on 24/10/2016.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

import Foundation
import ObjectMapper

struct List: Mappable {

    var dt : Int!
    
    var tempMin : Int!
    var tempMax : Int!
    
    var main: Main!
    var weather : [Weather]!
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        dt <- map["dt"]
        tempMin <- map["temp.min"]
        tempMax <- map["temp.max"]
        main <- map["main"]
        weather <- map["weather"]
    }
}
