//
//  Location.swift
//  Shinycloudy
//
//  Created by JanielHNY on 2017/11/11.
//  Copyright © 2017年 JanielHNY. All rights reserved.
//

import CoreLocation

class Location{
    static var sharedInstance = Location()
    private init () {}
    
    var latitude: Double!
    var longitude: Double!
    
}
