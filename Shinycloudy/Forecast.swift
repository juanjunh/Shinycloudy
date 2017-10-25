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














