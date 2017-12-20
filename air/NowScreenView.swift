//
//  NowScreenView.swift
//  air
//
//  Created by Ryan Yao on 2017-12-13.
//  Copyright © 2017 Ryan Yao. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON




class NowScreenView: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var feelLabel: UILabel!
    @IBOutlet var feelTemp: UILabel!
    @IBOutlet var nowTemp: UILabel!
    @IBOutlet var weatherIcon: UIImageView!
    
    
    
    let WEATHER_URL = "https://free-api.heweather.com/s6/weather"
    let APP_ID = "11f8312f8e9a4c529959b22a61a7d261"
    //var mainLocation = ViewController()
    var chineseLocation = ""
    
    
    //TODO: Declare instance variables here
//    let locationManager = CLLocationManager()
    let weatherDataModel = WeatherDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feelLabel.numberOfLines = 0

        cityLabel.numberOfLines = 0
        cityLabel.sizeToFit()

        
    }

   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testLangWith(string:String)->String?{
        if string.count < 100{
            return CFStringTokenizerCopyBestStringLanguage(string as CFString!, CFRange(location: 0, length: string.count)) as String?
        }
        else{
            return CFStringTokenizerCopyBestStringLanguage(string as CFString!, CFRange(location: 0, length: 100)) as String?
        }
        
    }
    


    
    //MARK: - JSON Parsing
    /***************************************************************/
    
    //Write the updateWeatherData method here:
    func updateNowWeatherData(json : JSON) {
        
        let data = json["HeWeather6"][0]
        let status = data["status"].stringValue
        //print(json)
        if status == "ok" {
            
            weatherDataModel.temperature = data["now"]["tmp"].intValue
            
            weatherDataModel.city = data["basic"]["location"].stringValue
            
            weatherDataModel.condition = data["now"]["cond_code"].intValue
            
            weatherDataModel.feel = data["now"]["fl"].intValue
            
            weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
            
            let voiceOverCondition = data["now"]["cond_txt"].stringValue
            
            self.weatherIcon.accessibilityLabel = voiceOverCondition
            
            let str = "\(weatherDataModel.city)"
            let lang = testLangWith(string: str)
            
            if lang == "zh-Hans" {
                
            }
                
            else {
               weatherDataModel.city = chineseLocation
                
            }
            updateUIWithWeatherData()
            
        }
            
            
        else {
            cityLabel.text = "天\n氣\n不\n可\n用"
        }
        
    }
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
    
    func updateUIWithWeatherData() {
        
        let engStr = "\(weatherDataModel.city)"
        let lang = testLangWith(string: engStr)
        
        if lang == "zh-Hans"{
            
        }
            
        else {
            
            for constraint in self.cityLabel.constraints {
                if constraint.identifier == "cityWidth" {
                    constraint.constant = 300
                }
            }
            cityLabel.layoutIfNeeded()
            
        }
        
        
        let attributedString = NSMutableAttributedString(string: "體\n感")
        let attributedStringCity = NSMutableAttributedString(string: "\(weatherDataModel.city)")
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineHeightMultiple = 0.8 // Whatever line spacing you want in points
        
        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        attributedStringCity.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedStringCity
            .length))
        
        
        // *** Set Attributed String to your label ***
        feelLabel.numberOfLines = 0
        feelLabel.attributedText = attributedString
        cityLabel.attributedText = attributedStringCity
        cityLabel.textAlignment = .right
        
        nowTemp.text = "\(weatherDataModel.temperature)°"
        feelTemp.text = "\(weatherDataModel.feel)°"
        weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)!
        
    }
    
    func changeBgColor() {
        view.backgroundColor = UIColor(red:0.33, green:0.56, blue:0.60, alpha:1.0)
        print("Success")
    }
    
    



}
