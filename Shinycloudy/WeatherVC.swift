//
//  WeatherVC.swift
//  Shinycloudy
//
//  Created by JanielHNY on 2017/10/12.
//  Copyright © 2017年 JanielHNY. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var currentTempLbl: UILabel!
    
    @IBOutlet weak var locationLbl: UILabel!
    
    @IBOutlet weak var currentWeatherImage: UIImageView!
    
    @IBOutlet weak var weatherTypeLbl: UILabel!
    
    @IBOutlet weak var weatherTableView: UITableView!
    
    
    let locationManager = CLLocationManager()
    var currentLocation = CLLocation!
    
    
    var currentweather : CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        
        currentweather = CurrentWeather()

    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(<#T##animated: Bool##Bool#>)
        locationAuthStatus()
    }
    
    func locationAuthStatus(){
        if locationManager.authorizationStatus() == .AuthorizedWhenInUse {
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            forecast = Forecast()
            currentweather.downloadweatherDetails {
            sefl.downloadForcastData{
            self.updatedUI()
            }
        }
            
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
    
        
    func downloadForecastData(completed: downloadcompleted) {
           //download forecast data for tableview
            
        //let forecastURL = URL(String: FORECAST_URL)
            Alamofire.request(.GET, FORECAST_URL).responseJSON { response in
                
                let result = response.result
        
                if let dict = result.value as? Dictionary<String, AnyObject>{
                    if let list = dict["list"] as? [Dictionary<String, AnyObject>]{
                        for obj in list {
                            let forecast = Forecast(weatherDict: obj)
                            self.forecasts.append(forecast)
                        }
                        self.forecasts.removeAtIndex(0)
                        self.tableView.reloadData()
                    }
                }
                
            }

        }
        
        
        //print(CURRENT_WEATHER_URL)
        
        //CurrentWeather.downloadweatherDetails{
        ////setup UI to downlaod data
          

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = weatherTableView.dequeueReusableCellWithIdentifier("weatherCell", forIndexPath: indexPath) as? WeatherCell {
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        } else {
            return WeatherCell()
        }

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

