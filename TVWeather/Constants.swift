//
//  Constants.swift
//  Weather
//
//  Created by Mujtaba Alam on 24/10/2016.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

import Foundation

private let appid = ""
private let baseURL = "http://api.openweathermap.org/data/2.5/"
private let query = "mode=json&type=accurate&units=metric&appid=\(appid)"

struct API {
    static let today = "\(baseURL)weather?\(query)"
    static let fivedays = "\(baseURL)forecast?\(query)"
    static let sevendays = "\(baseURL)forecast/daily?\(query)"
}
