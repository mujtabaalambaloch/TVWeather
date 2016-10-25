//
//  Sys.swift
//  TVWeather
//
//  Created by Mujtaba Alam on 24/10/2016.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

import Foundation
import ObjectMapper

struct Sys: Mappable {
    
    var country : String!
    var sunrise : Int!
    var sunset : Int!
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        country <- map["country"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
    }
}
