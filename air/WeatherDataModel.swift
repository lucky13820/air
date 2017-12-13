//
//  WeatherDataModel.swift
//  air
//
//  Created by Ryan Yao on 2017-12-13.
//  Copyright © 2017 Ryan Yao. All rights reserved.
//

import UIKit

class WeatherDataModel {
    
    //Declare your model variables here
    var temperature : Int = 0
    var condition : Int = 0
    var city : String = ""
    var weatherIconName : String = ""
    
    //This method turns a condition code into the name of the weather condition image
    
    func updateWeatherIcon(condition: Int) -> String {
        
        switch (condition) {
            
        case 101...104 :
            return "cloudy"
            
        case 200...213 :
            return "wind"
            
        case 300...304 :
            return "storm"
            
        case 305...313 :
            return "rain"
            
        case 400...407 :
            return "snow"
            
        case 500...508 :
            return "fog"
            
        case 100 :
            return "sunny"
            
        default :
            return "dunno"
        }
        
    }
}
