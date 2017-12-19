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
    var feel : Int = 0
    var forcastTempMin1 : Int = 0
    var forcastTempMax1 : Int = 0
    var forcastTempMin2 : Int = 0
    var forcastTempMax2 : Int = 0
    var forcastTempMin3 : Int = 0
    var forcastTempMax3 : Int = 0
    var forcastTempMin4 : Int = 0
    var forcastTempMax4 : Int = 0
    var forcastTempMin5 : Int = 0
    var forcastTempMax5 : Int = 0
    var forcastTempMin6 : Int = 0
    var forcastTempMax6 : Int = 0
    var forcastWeatherIcon1 : String = ""
    var forcastDate1 : String = ""
    var forcastCondition1 : Int = 0
    var forcastWeatherIcon2 : String = ""
    var forcastDate2 : String = ""
    var forcastCondition2 : Int = 0
    var forcastWeatherIcon3 : String = ""
    var forcastDate3 : String = ""
    var forcastCondition3 : Int = 0
    var forcastWeatherIcon4 : String = ""
    var forcastDate4 : String = ""
    var forcastCondition4 : Int = 0
    var forcastWeatherIcon5 : String = ""
    var forcastDate5 : String = ""
    var forcastCondition5 : Int = 0
    var forcastWeatherIcon6 : String = ""
    var forcastDate6 : String = ""
    var forcastCondition6 : Int = 0
    
    
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
    
    func updateWeatherIcon1(forcastCondition1: Int) -> String {
        
        switch (forcastCondition1) {
            
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
    
    func updateWeatherIcon3(forcastCondition3: Int) -> String {
        
        switch (forcastCondition3) {
            
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
    
    func updateWeatherIcon2(forcastCondition2: Int) -> String {
        
        switch (forcastCondition2) {
            
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
    func updateWeatherIcon4(forcastCondition4: Int) -> String {
        
        switch (forcastCondition4) {
            
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
    func updateWeatherIcon5(forcastCondition5: Int) -> String {
        
        switch (forcastCondition5) {
            
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
    func updateWeatherIcon6(forcastCondition6: Int) -> String {
        
        switch (forcastCondition6) {
            
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
