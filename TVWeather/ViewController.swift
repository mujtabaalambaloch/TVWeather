//
//  ViewController.swift
//  TVWeather
//
//  Created by Mujtaba Alam on 24/10/2016.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

import UIKit
import ObjectMapper

class ViewController: UIViewController, UITextFieldDelegate,  UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchTextfield: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var todayView: UIView!
    @IBOutlet weak var cityCountryLabel: UILabel!
    @IBOutlet weak var tempImageView: UIImageView!
    @IBOutlet weak var mainTempLabel: UILabel!
    @IBOutlet weak var tempDescHLLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    
    //View Model
    let viewModel = ViewModel()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchTextfield.delegate = self
        
        tableView.isHidden = true
        todayView.isHidden = true
        
        var text = "Cupertino"
        
        let cityValue = UserDefaults.standard.value(forKey: "cityKey")
        if cityValue != nil {
            text = cityValue as! String
        }
        
        apiRequest(city: text.capitalized)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Textfield delegate methods
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = searchTextfield.text , !text.isEmpty else {
            return
        }
        
        apiRequest(city: text.capitalized)
    }
    
    // MARK: - API Request
    
    func apiRequest(city: String) {
        
        let trimmedCity = city.replacingOccurrences(of: " ", with: "")
        
        viewModel.apiRequest(city: trimmedCity) { (success) in
            
            if success! {
                
                UserDefaults.standard.set(city, forKey: "cityKey")
                
                self.cityCountryLabel.text = self.viewModel.cityCountry()
                self.tempImageView.image = UIImage(named: self.viewModel.temperatureImage())
                self.mainTempLabel.text = self.viewModel.mainTemperature()
                self.tempDescHLLabel.text = self.viewModel.descriptionMinMax()
                self.pressureLabel.text = self.viewModel.pressure()
                self.humidityLabel.text = self.viewModel.humidity()
                self.sunriseLabel.text = self.viewModel.sunrise()
                self.sunsetLabel.text = self.viewModel.sunset()
                self.tableView.reloadData()
                self.setNeedsFocusUpdate()
                self.todayView.isHidden = false
                self.tableView.isHidden = false
            }
        }
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfForecast()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ForecastTableViewCell
        
        cell.dayLabel.text = viewModel.getDay(index: indexPath)
        cell.dayImageView.image = UIImage(named: viewModel.forecastImage(index: indexPath))
        cell.dayDescLabel.text = viewModel.desc(index: indexPath)
        cell.dayMaxTempLabel.text = viewModel.maxTemp(index: indexPath)
        cell.dayMinTempLabel.text = viewModel.minTemp(index: indexPath)
        return cell
    }
}
