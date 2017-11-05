//
//  WeatherVC.swift
//  Shinycloudy
//
//  Created by JanielHNY on 2017/10/12.
//  Copyright © 2017年 JanielHNY. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var currentTempLbl: UILabel!
    
    @IBOutlet weak var locationLbl: UILabel!
    
    @IBOutlet weak var currentWeatherImage: UIImageView!
    
    @IBOutlet weak var weatherTypeLbl: UILabel!
    
    @IBOutlet weak var weatherTableView: UITableView!
    
    var currentweather : CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        
        currentweather = CurrentWeather()
//        forecast = Forecast()
//        currentweather.downloadweatherDetails {
//        sefl.downloadForcastData{
//          self.updatedUI()
        
//        }
        
        
    func downloadForecastData(completed: downloadcompleted) {
           //download forecast data for tableview
            
        let forecastURL = URL(String: FORECAST_URL)!
            alamofire.request(.GET, forecastURL).responseJSON { response in
                
                let result = response.result
        
                if let dict = result.value as? Dictionary<String, AnyObject>{
                    if let list = dict["list"] as? [Dictionary<String, AnyObject>]{
                        for obj in list {
                            let forecast = Forecast(weatherDict: obj)
                            self.forecasts.append(forecast)
                        }
                    }
                }
                

            }
            
            
            
        }
        
        
        //print(CURRENT_WEATHER_URL)
        
        //CurrentWeather.downloadweatherDetails{
        ////setup UI to downlaod data
          
    
    
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = weatherTableView.dequeueReusableCellWithIdentifier("weatherCell", forIndexPath: indexPath)
        return cell
    
    }
    
    
    func updateMainUI() {
        dateLbl.text = currentweather.date
        currentTempLbl.text = "\(currentweather.currentTemp)"
        weatherTypeLbl.text = currentweather.weatherType
        locationLbl.text = currentweather.cityName
        currentWeatherImage.image = UIImage(named: currentweather.weatherType)
        //need to download assets
        
        
        
        
    }
    
    
    

    


}

