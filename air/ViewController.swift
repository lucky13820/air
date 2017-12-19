//
//  ViewController.swift
//  air
//
//  Created by Ryan Yao on 2017-12-13.
//  Copyright © 2017 Ryan Yao. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var mainScroll: UIScrollView!
    
    var cityInFull = ""
    let WEATHER_URL = "https://free-api.heweather.com/s6/weather"
    let APP_ID = "11f8312f8e9a4c529959b22a61a7d261"
    var nowWeather = NowScreenView()
    var forWeather = ForcastScreenView()
    var creditScreen = CreditScreenView()
    
    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up individual view for scroll view
        
        let xOrigin = self.view.frame.width
        
        creditScreen = CreditScreenView(nibName: "CreditScreenView", bundle: nil)

        mainScroll.addSubview(creditScreen.view)

        forWeather = ForcastScreenView(nibName: "ForcastScreenView", bundle: nil)

        mainScroll.addSubview(forWeather.view)

        nowWeather  = NowScreenView(nibName: "NowScreenView", bundle: nil)

        mainScroll.addSubview(nowWeather.view)
        
        
       
        // set up the size for each view
        creditScreen.view.frame = CGRect(x: 0, y: 0, width: xOrigin, height: self.view.frame.height)

        forWeather.view.frame = CGRect(x: xOrigin, y: 0, width: xOrigin, height: self.view.frame.height)

        nowWeather.view.frame = CGRect(x: xOrigin * 2, y: 0, width: xOrigin, height: self.view.frame.height)
        
        mainScroll.frame = CGRect(x: 0, y: 0, width: xOrigin, height: self.view.frame.height)
        
        mainScroll.contentSize = CGSize(width: CGFloat(xOrigin * 3), height: CGFloat(self.view.frame.height))
        mainScroll.contentOffset.x = xOrigin * 3
        
        mainScroll.setContentOffset(CGPoint(x: xOrigin * 2, y: 0), animated: true)
        mainScroll.translatesAutoresizingMaskIntoConstraints = true
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:
                nowWeather.view.backgroundColor = UIColor.black
                forWeather.view.backgroundColor = UIColor.black
                creditScreen.view.backgroundColor = UIColor.black
            default:
                print("default")
            }
        }
        
        self.view.accessibilityElements = [self.nowWeather.cityLabel, self.nowWeather.weatherIcon, self.nowWeather.nowTemp, self.nowWeather.feelLabel, self.nowWeather.feelTemp,
            self.forWeather.forcastDate1, self.forWeather.forcastCondition1, self.forWeather.forcastTemp1Min, self.forWeather.forcastTemp1Max,
            self.forWeather.forcastDate2,self.forWeather.forcastCondition2, self.forWeather.forcastTemp2Min, self.forWeather.forcastTemp2Max,
            self.forWeather.forcastDate3, self.forWeather.forcastCondition3, self.forWeather.forcastTemp3Min, self.forWeather.forcastTemp3Max,
            self.forWeather.forcastDate4,self.forWeather.forcastCondition4, self.forWeather.forcastTemp4Min, self.forWeather.forcastTemp4Max,
            self.forWeather.forcastDate5, self.forWeather.forcastCondition5, self.forWeather.forcastTemp5Min, self.forWeather.forcastTemp5Max,
            self.forWeather.forcastDate6,self.forWeather.forcastCondition6, self.forWeather.forcastTemp6Min, self.forWeather.forcastTemp6Max,
            self.creditScreen.appName, self.creditScreen.nameLabel, self.creditScreen.weiboButton, self.creditScreen.twitterButton,self.creditScreen.weatherButton,
        ];

        
        
        
        //Set up the location manager here.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[locations.count - 1 ]
        
        if location.horizontalAccuracy > 0 {
            
            let geoCoder = CLGeocoder()
            geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
                
                // Place details
                var placeMark: CLPlacemark!
                placeMark = (placemarks?.last)!
                
                // Location name
                if let city = placeMark.addressDictionary!["City"] as? NSString {
                    self.cityInFull = city as String
                    let params : [String : String] = ["location" : self.cityInFull, "key" : self.APP_ID, "lang" : "hk"]
                    print(params)
                    self.getWeatherData(url: self.WEATHER_URL, parameters: params)
                    self.locationManager.stopUpdatingLocation()
                }
                
            })
            
           
            
        }
        
        
    }
    
    
    
    //Write the didFailWithError method here:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        nowWeather.cityLabel.text = "天\n气\n不\n可\n用"
    }
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    func  getWeatherData(url: String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                print("Success! Got the weather data")
                
                let weatherJSON : JSON = JSON(response.result.value!)
                
                print(weatherJSON)
                
                self.nowWeather.updateNowWeatherData(json: weatherJSON)
                self.forWeather.updateForcastWeatherData(json: weatherJSON)
            }
            else {
                print("Error \(String(describing: response.result.error))")
                self.nowWeather.cityLabel.text = "鏈\n接\n不\n可\n用"
            }
        }
    }
    


}

