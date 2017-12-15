//
//  ForcastScreenView.swift
//  air
//
//  Created by Ryan Yao on 2017-12-13.
//  Copyright © 2017 Ryan Yao. All rights reserved.
//

import UIKit
import SwiftyJSON

class ForcastScreenView: UIViewController {

    @IBOutlet var forcastTemp1Max: UILabel!
    @IBOutlet var forcastTemp1Min: UILabel!
    @IBOutlet var forcastCondition1: UIImageView!
    @IBOutlet var forcastDate1: UILabel!
    let weatherDataModel = WeatherDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - JSON Parsing
    /***************************************************************/
    
    //Write the updateWeatherData method here:
    func updateForcastWeatherData(json : JSON) {
        
        let data = json["HeWeather6"][0]
        let status = data["status"].stringValue
        //print(json)
        if status == "ok" {
            
            weatherDataModel.forcastTempMin1 = data["daily_forecast"][0]["tmp_min"].intValue
            
            weatherDataModel.forcastTempMax1 = data["daily_forecast"][0]["tmp_max"].intValue
            
            weatherDataModel.forcastCondition1 = data["daily_forecast"][0]["cond_code_d"].intValue
            
            weatherDataModel.forcastDate1 = data["daily_forecast"][0]["date"].stringValue
            
            weatherDataModel.forcastWeatherIcon1 = weatherDataModel.updateWeatherIcon1(forcastCondition1: weatherDataModel.forcastCondition1)
            
            updateUIWithWeatherData()
            
        }
            
        else {
            //cityLabel.text = "天\n气\n不\n可\n用"
        }
        
    }
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
    
    func updateUIWithWeatherData() {
        
        func getDayOfWeek(today:String)->Int {
            let formatter  = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let todayDate = formatter.date(from: today)!
            let myCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
            let myComponents = myCalendar.components(.weekday, from: todayDate)
            let weekDay = myComponents.weekday
            return weekDay!
        }
        
        let chineseWeek = ["日", "一", "二", "三", "四", "五", "六,"]
        let dateNum = weatherDataModel.forcastDate1
        let weekday = getDayOfWeek(today: dateNum)
        
        forcastTemp1Min.text = "\(weatherDataModel.forcastTempMin1)º"
        forcastTemp1Max.text = "\(weatherDataModel.forcastTempMax1)º"
        forcastDate1.text = "\(chineseWeek[weekday - 1])"
        forcastCondition1.image = UIImage(named: weatherDataModel.forcastWeatherIcon1)!

    }

}
