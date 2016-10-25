//
//  Forecast.swift
//  Weather
//
//  Created by Mujtaba Alam on 24/10/2016.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

import Foundation
import ObjectMapper

class Forecast: Mappable {

    var cnt : Int!
    var cod : String!
    var list : [List]!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        cnt <- map["cnt"]
        cod <- map["cod"]
        list <- map["list"]
    }
}
