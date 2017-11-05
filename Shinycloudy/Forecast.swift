//
//  Forcast.swift
//  Shinycloudy
//
//  Created by JanielHNY on 2017/10/25.
//  Copyright © 2017年 JanielHNY. All rights reserved.
//

import UIKit

// import Alamofire

class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String{
        if _date == nil{
            _date = ""
        }
        return _date
    }
    
    var weatherType: String{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String{
        if _highTemp == nil{
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil{
            _lowTemp = ""
        }
        return _lowTemp
    }

    init (weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let min = temp["min"] as? Double {
                let kelvinToCelsiusPreDiv = min - 273.15
                let kelvinToCelsius = Double(round(10 * kelvinToCelsiusPreDiv)/10)
                self._lowTemp = "\(kelvinToCelsius)"
            }
            
            if let max = temp["max"] as? Double {
                let kelvinToCelsiusPreDiv = max - 273.15
                let kelvinToCelsius = Double(round(10 * kelvinToCelsiusPreDiv)/10)
                self._highTemp = "\(kelvinToCelsius)"
            }
                
                
            }
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = NSDate(NSTimeIntervalSince1970)
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .FullStyle
            dateFormatter.dateformat = "EEEE"
            dateFormatter.timeStyle = .NoStyle
            self._date = unixConvertedDate.dayOfTheWeek()
            
            
        }
        
            
        }
    
    }
extension NSDate {
    func dayOfTheWeek() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateformat = "EEEE"  //means showing full details of the date
        return dateFormatter.stringFromDate(self)
        
    }
}




var forecast: Forecast!

override func viewDidLoad() {
    super.viewDidLoad()
    forecast = Forecast()
}

func downloadForecastData(completed: downloadcompleted) {
    //download forecast data for tableview
    
    let forecastURL = URL(String: FORECAST_URL)
    alamofire.request(.GET, forecastURL).responseJSON {
        response in
        let result = response.result
        
        if let dict = result.value as? Dictionary<String, AnyObject>{
            if let list = dict["list"] as? [Dictionary<String, AnyObject>]{
                for obj in list {
                    let forecast = Forecast(weatherDict: obj)
                }
            }
        }
        
        
    }
    
    
    
}














