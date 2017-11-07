//
//  WeatherCell.swift
//  Shinycloudy
//
//  Created by JanielHNY on 2017/11/7.
//  Copyright © 2017年 JanielHNY. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    func configureCell(forecast: Forecast) {
        weatherIcon.image = UIImage(named: forecast.weatherType)
        dayLbl.text = forecast.date
        weatherType.text = forecast.weatherType
        lowTemp.text = "\(forecast.lowTemp)"
        highTemp.text = "\(forecast.highTemp)"
        
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    

}
