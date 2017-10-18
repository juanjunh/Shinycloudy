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
    
}










