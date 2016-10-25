//
//  Weather.swift
//  Weather
//
//  Created by Mujtaba Alam on 24/10/2016.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

import Foundation
import ObjectMapper

struct Weather: Mappable {
    
    var descriptionField : String!
    var icon : String!
    var id : Int!
    var main : String!
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        descriptionField <- map["description"]
        icon <- map["icon"]
        id <- map["id"]
        main <- map["main"]
    }
}
