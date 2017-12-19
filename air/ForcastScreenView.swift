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
//         self.view.accessibilityElements = [
//            self.forcastDate1, self.forcastCondition1, self.forcastTemp1Min, self.forcastTemp1Max,
//            self.forcastDate2,self.forcastCondition2, self.forcastTemp2Min, self.forcastTemp2Max,
//            self.forcastDate3, self.forcastCondition3, self.forcastTemp3Min, self.forcastTemp3Max,
//            self.forcastDate4,self.forcastCondition4, self.forcastTemp4Min, self.forcastTemp4Max,
//            self.forcastDate5, self.forcastCondition5, self.forcastTemp5Min, self.forcastTemp5Max,
//            self.forcastDate6,self.forcastCondition6, self.forcastTemp6Min, self.forcastTemp6Max,
//            ];
        
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
            
            let voiceOverCondition1 = data["daily_forecast"][0]["cond_txt_d"].stringValue
            
            self.forcastCondition1.accessibilityLabel = voiceOverCondition1
            self.forcastDate1.accessibilityLabel = weatherDataModel.forcastDate1
            
            
            weatherDataModel.forcastTempMin2 = data["daily_forecast"][1]["tmp_min"].intValue
            
            weatherDataModel.forcastTempMax2 = data["daily_forecast"][1]["tmp_max"].intValue
            
            weatherDataModel.forcastCondition2 = data["daily_forecast"][1]["cond_code_d"].intValue
            
            weatherDataModel.forcastDate2 = data["daily_forecast"][1]["date"].stringValue
            
            weatherDataModel.forcastWeatherIcon2 = weatherDataModel.updateWeatherIcon2(forcastCondition2: weatherDataModel.forcastCondition2)
            
            let voiceOverCondition2 = data["daily_forecast"][1]["cond_txt_d"].stringValue
            
            self.forcastCondition2.accessibilityLabel = voiceOverCondition2
            self.forcastDate2.accessibilityLabel = weatherDataModel.forcastDate2
            
            weatherDataModel.forcastTempMin3 = data["daily_forecast"][2]["tmp_min"].intValue
            
            weatherDataModel.forcastTempMax3 = data["daily_forecast"][2]["tmp_max"].intValue
            
            weatherDataModel.forcastCondition3 = data["daily_forecast"][2]["cond_code_d"].intValue
            
            weatherDataModel.forcastDate3 = data["daily_forecast"][2]["date"].stringValue
            
            weatherDataModel.forcastWeatherIcon3 = weatherDataModel.updateWeatherIcon3(forcastCondition3: weatherDataModel.forcastCondition3)
            
            let voiceOverCondition3 = data["daily_forecast"][2]["cond_txt_d"].stringValue
            
            self.forcastCondition3.accessibilityLabel = voiceOverCondition3
            self.forcastDate3.accessibilityLabel = weatherDataModel.forcastDate3
            
            weatherDataModel.forcastTempMin4 = data["daily_forecast"][3]["tmp_min"].intValue
            
            weatherDataModel.forcastTempMax4 = data["daily_forecast"][3]["tmp_max"].intValue
            
            weatherDataModel.forcastCondition4 = data["daily_forecast"][3]["cond_code_d"].intValue
            
            weatherDataModel.forcastDate4 = data["daily_forecast"][3]["date"].stringValue
            
            weatherDataModel.forcastWeatherIcon4 = weatherDataModel.updateWeatherIcon4(forcastCondition4: weatherDataModel.forcastCondition4)
            
            let voiceOverCondition4 = data["daily_forecast"][3]["cond_txt_d"].stringValue
            
            self.forcastCondition4.accessibilityLabel = voiceOverCondition4
            self.forcastDate4.accessibilityLabel = weatherDataModel.forcastDate4
            
            weatherDataModel.forcastTempMin5 = data["daily_forecast"][4]["tmp_min"].intValue
            
            weatherDataModel.forcastTempMax5 = data["daily_forecast"][4]["tmp_max"].intValue
            
            weatherDataModel.forcastCondition5 = data["daily_forecast"][4]["cond_code_d"].intValue
            
            weatherDataModel.forcastDate5 = data["daily_forecast"][4]["date"].stringValue
            
            weatherDataModel.forcastWeatherIcon5 = weatherDataModel.updateWeatherIcon5(forcastCondition5: weatherDataModel.forcastCondition5)
            
            let voiceOverCondition5 = data["daily_forecast"][4]["cond_txt_d"].stringValue
            
            self.forcastCondition5.accessibilityLabel = voiceOverCondition5
            self.forcastDate5.accessibilityLabel = weatherDataModel.forcastDate5
            
            weatherDataModel.forcastTempMin6 = data["daily_forecast"][5]["tmp_min"].intValue
            
            weatherDataModel.forcastTempMax6 = data["daily_forecast"][5]["tmp_max"].intValue
            
            weatherDataModel.forcastCondition6 = data["daily_forecast"][5]["cond_code_d"].intValue
            
            weatherDataModel.forcastDate6 = data["daily_forecast"][5]["date"].stringValue
            
            weatherDataModel.forcastWeatherIcon6 = weatherDataModel.updateWeatherIcon6(forcastCondition6: weatherDataModel.forcastCondition6)
            
            let voiceOverCondition6 = data["daily_forecast"][5]["cond_txt_d"].stringValue
            
            self.forcastCondition6.accessibilityLabel = voiceOverCondition6
            self.forcastDate6.accessibilityLabel = weatherDataModel.forcastDate6
            
            
            
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
        let dateNum5 = weatherDataModel.forcastDate5
        let weekday5 = getDayOfWeek(today: dateNum5)
        let dateNum4 = weatherDataModel.forcastDate4
        let weekday4 = getDayOfWeek(today: dateNum4)
        let dateNum6 = weatherDataModel.forcastDate6
        let weekday6 = getDayOfWeek(today: dateNum6)
        
        forcastTemp1Min.text = "\(weatherDataModel.forcastTempMin1)°"
        forcastTemp1Max.text = "\(weatherDataModel.forcastTempMax1)°"
        forcastDate1.text = "\(chineseWeek[weekday1 - 1])"
        forcastCondition1.image = UIImage(named: weatherDataModel.forcastWeatherIcon1)!
        
        forcastTemp2Min.text = "\(weatherDataModel.forcastTempMin2)°"
        forcastTemp2Max.text = "\(weatherDataModel.forcastTempMax2)°"
        forcastDate2.text = "\(chineseWeek[weekday2 - 1])"
        forcastCondition2.image = UIImage(named: weatherDataModel.forcastWeatherIcon2)!
        
        forcastTemp3Min.text = "\(weatherDataModel.forcastTempMin3)°"
        forcastTemp3Max.text = "\(weatherDataModel.forcastTempMax3)°"
        forcastDate3.text = "\(chineseWeek[weekday3 - 1])"
        forcastCondition3.image = UIImage(named: weatherDataModel.forcastWeatherIcon3)!
        
        forcastTemp4Min.text = "\(weatherDataModel.forcastTempMin4)°"
        forcastTemp4Max.text = "\(weatherDataModel.forcastTempMax4)°"
        forcastDate4.text = "\(chineseWeek[weekday4 - 1])"
        forcastCondition4.image = UIImage(named: weatherDataModel.forcastWeatherIcon4)!

        forcastTemp5Min.text = "\(weatherDataModel.forcastTempMin5)°"
        forcastTemp5Max.text = "\(weatherDataModel.forcastTempMax5)°"
        forcastDate5.text = "\(chineseWeek[weekday5 - 1])"
        forcastCondition5.image = UIImage(named: weatherDataModel.forcastWeatherIcon5)!

        forcastTemp6Min.text = "\(weatherDataModel.forcastTempMin6)°"
        forcastTemp6Max.text = "\(weatherDataModel.forcastTempMax6)°"
        forcastDate6.text = "\(chineseWeek[weekday6 - 1])"
        forcastCondition6.image = UIImage(named: weatherDataModel.forcastWeatherIcon6)!

    }

}
