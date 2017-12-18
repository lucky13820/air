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
    @IBOutlet var forcastTemp3Max: UILabel!
    @IBOutlet var forcastTemp3Min: UILabel!
    @IBOutlet var forcastCondition3: UIImageView!
    @IBOutlet var forcastDate3: UILabel!
    @IBOutlet var forcastTemp4Max: UILabel!
    @IBOutlet var forcastTemp4Min: UILabel!
    @IBOutlet var forcastCondition4: UIImageView!
    @IBOutlet var forcastDate4: UILabel!
    @IBOutlet var forcastTemp5Max: UILabel!
    @IBOutlet var forcastTemp5Min: UILabel!
    @IBOutlet var forcastCondition5: UIImageView!
    @IBOutlet var forcastDate5: UILabel!
    @IBOutlet var forcastTemp6Max: UILabel!
    @IBOutlet var forcastTemp6Min: UILabel!
    @IBOutlet var forcastCondition6: UIImageView!
    @IBOutlet var forcastDate6: UILabel!
    @IBOutlet var forcastDate2: UILabel!
    
    @IBOutlet var forcastTemp2Max: UILabel!
    @IBOutlet var forcastTemp2Min: UILabel!
    @IBOutlet var forcastCondition2: UIImageView!
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
            
            weatherDataModel.forcastTempMin2 = data["daily_forecast"][1]["tmp_min"].intValue
            
            weatherDataModel.forcastTempMax2 = data["daily_forecast"][1]["tmp_max"].intValue
            
            weatherDataModel.forcastCondition2 = data["daily_forecast"][1]["cond_code_d"].intValue
            
            weatherDataModel.forcastDate2 = data["daily_forecast"][1]["date"].stringValue
            
            weatherDataModel.forcastWeatherIcon2 = weatherDataModel.updateWeatherIcon2(forcastCondition2: weatherDataModel.forcastCondition2)
            
            weatherDataModel.forcastTempMin3 = data["daily_forecast"][2]["tmp_min"].intValue
            
            weatherDataModel.forcastTempMax3 = data["daily_forecast"][2]["tmp_max"].intValue
            
            weatherDataModel.forcastCondition3 = data["daily_forecast"][2]["cond_code_d"].intValue
            
            weatherDataModel.forcastDate3 = data["daily_forecast"][2]["date"].stringValue
            
            weatherDataModel.forcastWeatherIcon3 = weatherDataModel.updateWeatherIcon3(forcastCondition3: weatherDataModel.forcastCondition3)
            
            
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
            //let weekDay2 = myComponents.weekday
            //let weekDay3 = myComponents.weekday
            return weekDay!
        }
        
        let chineseWeek = ["日", "一", "二", "三", "四", "五", "六"]
        let dateNum1 = weatherDataModel.forcastDate1
        let weekday1 = getDayOfWeek(today: dateNum1)
        let dateNum2 = weatherDataModel.forcastDate2
        let weekday2 = getDayOfWeek(today: dateNum2)
        let dateNum3 = weatherDataModel.forcastDate3
        let weekday3 = getDayOfWeek(today: dateNum3)
        
        forcastTemp1Min.text = "\(weatherDataModel.forcastTempMin1)º"
        forcastTemp1Max.text = "\(weatherDataModel.forcastTempMax1)º"
        forcastDate1.text = "\(chineseWeek[weekday1 - 1])"
        forcastCondition1.image = UIImage(named: weatherDataModel.forcastWeatherIcon1)!
        
        forcastTemp2Min.text = "\(weatherDataModel.forcastTempMin2)º"
        forcastTemp2Max.text = "\(weatherDataModel.forcastTempMax2)º"
        forcastDate2.text = "\(chineseWeek[weekday2 - 1])"
        forcastCondition2.image = UIImage(named: weatherDataModel.forcastWeatherIcon2)!
        
        forcastTemp3Min.text = "\(weatherDataModel.forcastTempMin3)º"
        forcastTemp3Max.text = "\(weatherDataModel.forcastTempMax3)º"
        forcastDate3.text = "\(chineseWeek[weekday3 - 1])"
        forcastCondition3.image = UIImage(named: weatherDataModel.forcastWeatherIcon3)!

    }

}
