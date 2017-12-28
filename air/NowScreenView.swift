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
import OpenCC



class NowScreenView: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var bottomContainer: UIView!
    @IBOutlet weak var middleContainer: UIView!
    @IBOutlet weak var topContainer: UIView!
    @IBOutlet weak var blackBg: UIView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var feelLabel: UILabel!
    @IBOutlet var feelTemp: UILabel!
    @IBOutlet var nowTemp: UILabel!
    @IBOutlet var weatherIcon: UIImageView!
    

    //var mainLocation = ViewController()
    var chineseLocation = ""
    
    
    //TODO: Declare instance variables here
//    let locationManager = CLLocationManager()
    let weatherDataModel = WeatherDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feelLabel.numberOfLines = 0
        feelLabel.sizeToFit()
        cityLabel.numberOfLines = 0
        cityLabel.sizeToFit()
        
        UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseIn, animations: {
            self.cityLabel.alpha = 1
            self.feelLabel.alpha = 1
            self.feelTemp.alpha = 1
            self.nowTemp.alpha = 1
            self.weatherIcon.alpha = 1
        })
         
        UIView.animate(withDuration: 0.8, delay: 0.2, options: .curveEaseOut, animations: {
            self.blackBg.alpha = 0.0
        })
        

        
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
            
            weatherDataModel.parent = data["basic"]["parent_city"].stringValue
            
            weatherDataModel.condition = data["now"]["cond_code"].intValue
            
            weatherDataModel.feel = data["now"]["fl"].intValue
            
            weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
            
            let voiceOverCondition = data["now"]["cond_txt"].stringValue
            
            self.weatherIcon.accessibilityLabel = voiceOverCondition
            
            
            let str = "\(weatherDataModel.city)"
            let lang = testLangWith(string: str)
            
            
            if lang == "zh-Hant" || lang == "ja" || lang == "zh-Hans"{
                
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
        
        if lang == "zh-Hant" || lang == "ja" || lang == "zh-Hans"{
            
        }
            
        else {
            
            for constraint in self.cityLabel.constraints {
                if constraint.identifier == "cityWidth" {
                    constraint.constant = 300
                }
            }
            cityLabel.layoutIfNeeded()
            
        }
        
        
        // *** Set Attributed String to your label ***
        if weatherDataModel.parent.isEmpty {
            cityLabel.text = weatherDataModel.city
        }
        else {
            cityLabel.text = weatherDataModel.parent
            
        }
        cityLabel.textAlignment = .right
        let traditionLabel = cityLabel.text
        let converter = ChineseConverter(option: [.traditionalize, .TWStandard, .TWIdiom])
        cityLabel.text = converter.convert(traditionLabel!)
        
        feelLabel.text = "體\n感"
        nowTemp.text = "\(weatherDataModel.temperature)°"
        feelTemp.text = "\(weatherDataModel.feel)°"
        weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)!
        
    }
    



}
