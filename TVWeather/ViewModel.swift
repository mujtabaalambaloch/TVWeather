//
//  ViewModel.swift
//  TVWeather
//
//  Created by Mujtaba Alam on 24/10/2016.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

import UIKit
import ObjectMapper

class ViewModel: NSObject {
    
    var temperature: Temperature!
    var listArray = [List]()
    
    // MARK: - API Request
    
    func apiRequest(city:String, completion: ((_ success : Bool?) -> Void)?) {
        
        let network = Network()
        
        if !network.hasConnectivity() {
            completion!(false)
        }
        
        let serviceGroup = DispatchGroup()
        var current = false
        var seven = false
        
        let cityName = "&q=\(city)"
        
        serviceGroup.enter()
        network.getRequest(url: API.today.appending(cityName), completion: { (success, value) in
            serviceGroup.leave()
            if success! {
                self.temperature = Mapper<Temperature>().map(JSONString: value!)!
                current = true
            }
        })
        
        serviceGroup.enter()
        network.getRequest(url: API.sevendays.appending(cityName), completion: { (success, value) in
            serviceGroup.leave()
            if success! {
                let forecast = Mapper<Forecast>().map(JSONString: value!)!
                self.listArray = forecast.list
                seven = true
            }
        })
        
        serviceGroup.notify(queue: DispatchQueue.main) {
            if current && seven {
                completion!(true)
            } else {
                completion!(false)
            }
        }
    }
    
    
    // MARK: - Common methods
    
    private func maxTemp(main: Main) -> String {
        return "High: \(main.tempMax!)°"
    }
    
    private func minTemp(main: Main) -> String {
        return "Low: \(main.tempMin!)°"
    }
    
    private func mainDesc(weather: Weather) -> String {
        return weather.descriptionField!.capitalized
    }
    
    private func maxDay() -> String {
        return "High: \(self.listArray[0].tempMax!)°"
    }
    
    private func minDay() -> String {
        return "Low: \(self.listArray[0].tempMin!)°"
    }
    
    // MARK: - Temperature methods
    
    func cityCountry() -> String {
        return "\(temperature.name!), \(temperature.sys.country!)"
    }
    
    func mainTemperature() -> String {
        
        if temperature.main.temp! >= 100 || temperature.main.temp! <= -10 {
            return "\(temperature.main.temp!)°"
        } else {
            return "\(temperature.main.temp!)° C"
        }
    }
    
    func temperatureImage() -> String {
        return temperature.weather[0].icon
    }
    
    func descriptionMinMax() -> String {
        return "\(mainDesc(weather: temperature.weather[0])), \(maxDay()) / \(minDay())"
    }
    
    func pressure() -> String {
        return "\(temperature.main.pressure!) hPa"
    }
    
    func humidity() -> String {
        return "\(temperature.main.humidity!) %"
    }
    
    func sunrise() -> String {
        return "\(DateTool.dayFrom(time: temperature.sys.sunrise, showTime: true))"
    }
    
    func sunset() -> String {
        return "\(DateTool.dayFrom(time: temperature.sys.sunset, showTime: true))"
    }
    
    // MARK: - Table view Methods

    private func list(index: IndexPath) -> List {
        return self.listArray[index.row+1]
    }
    
    func numberOfForecast() -> Int {
        return self.listArray.count - 1
    }
    
    func getDay(index: IndexPath) -> String {
        return DateTool.dayFrom(time: list(index: index).dt).uppercased()
    }
    
    func maxTemp(index: IndexPath) -> String {
        return "High: \(list(index: index).tempMax!)°"
    }
    
    func minTemp(index: IndexPath) -> String {
        return "Low: \(list(index: index).tempMin!)°"
    }
    
    func desc(index: IndexPath) -> String {
        return list(index: index).weather[0].descriptionField.capitalized
    }
    
    func forecastImage(index: IndexPath) -> String {
        return list(index: index).weather[0].icon!
    }
}
