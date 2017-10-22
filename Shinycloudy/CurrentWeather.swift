//
//  CurrentWeather.swift
//  Shinycloudy
//
//  Created by JanielHNY on 2017/10/18.
//  Copyright © 2017年 JanielHNY. All rights reserved.
//

import UIKit
//import Alamofire


class CurrentWeather{
    
    var _cityName:String!
    var _date:String!
    var _weatherType:String!
    var _currentTemp:Double!
    
    
    var cityName:String{
        if _cityName == nil{
           _cityName = ""
        }
        return _cityName
    }
    
    var date:String{
        if _date == nil{
            _date = ""
        }
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .LongStyle
        dateFormatter.timeStyle = .NoStyle
        let currentDate = dateFormatter.stringFromDate(NSDate())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    
    var weatherType:String{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp:Double{
        if _currentTemp == nil{
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    //func downloadweatherDetails(complpeted: downloadComplete){
        //alamofire download
        
        //let currentWeatherURL = NSMetadataItemURLKey (CURRENT_WEATHER_URL)!
        //swift 8.0 以上為URL, 這裡7.0版本找不到是哪個
        
        //alamofire.request(.GET, currentWeatherURL).responseJSON { response in
        //let result = response.result }
    
//    if let dict = result.value as? Dictionary <string, anyobject> {
//        if let name = dict["name"] as? String{
//            self._cityName = name.capitalized
//            
//        }
//        if let weather = dict["weather"] as? [Dictionary<String, AnyObject>]{
//            if let main = weather[0]["main"] as? String {
//                self._weatherType = main.capitalized
//            }
//        }
//        if let main = dict["main"] as? Dictionary<String, AnyObject> {
//            if let currentTemp = main["temp"] as? Double {
//                let kelvinToCelsiusPreDiv = currentTemp - 273.15
//                let kelvinToCelsius = Double(round(10 * kelvinToCelsiusPreDiv)/10)
//                self._currentTemp = kelvinToCelsius
//                
//            }
//        }
//        
//    }
    
    
        //completed()
            
        
    
        
    }
    
    











