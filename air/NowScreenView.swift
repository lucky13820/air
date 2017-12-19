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
    
    
    
    
    //TODO: Declare instance variables here
//    let locationManager = CLLocationManager()
    let weatherDataModel = WeatherDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feelLabel.numberOfLines = 0

        cityLabel.numberOfLines = 0
        cityLabel.sizeToFit()
        
        //self.view.accessibilityElements = [self.cityLabel, self.weatherIcon, self.nowTemp, self.feelLabel, self.feelTemp];
    
        
    }

   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    //MARK: - Networking
//    /***************************************************************/
//    
//    //Write the getWeatherData method here:
//    func  getWeatherData(url: String, parameters: [String : String]) {
//        
//        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
//            response in
//            if response.result.isSuccess {
//                print("Success! Got the weather data")
//                
//                let weatherJSON : JSON = JSON(response.result.value!)
//                
//                print(weatherJSON)
//                
//                self.updateWeatherData(json: weatherJSON)
//            }
//            else {
//                print("Error \(String(describing: response.result.error))")
//                self.cityLabel.text = "链\n接\n不\n可\n用"
//            }
//        }
//    }

    
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
        
        feelLabel.text = "體\n感"
        feelLabel.numberOfLines = 0
        cityLabel.text = "\(weatherDataModel.city)"
        nowTemp.text = "\(weatherDataModel.temperature)°"
        feelTemp.text = "\(weatherDataModel.feel)°"
        weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)!
        
    }
    
    
    
    


}
