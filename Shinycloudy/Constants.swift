//
//  Constants.swift
//  Shinycloudy
//
//  Created by JanielHNY on 2017/10/18.
//  Copyright © 2017年 JanielHNY. All rights reserved.
//

import Foundation

let BASE_URL = "http://samples.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "995bf01afe353fe59afa0968fc3ffc6f"

//typealias downloadComplete = () -> ()

let CURRENT_WEATHER_URL = "http://samples.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&mode=json&appid=995bf01afe353fe59afa0968fc3ffc6f"

let FORECAST_URL = "http://samples.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&mode=json&appid=995bf01afe353fe59afa0968fc3ffc6f"




