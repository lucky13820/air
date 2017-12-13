//
//  ViewController.swift
//  air
//
//  Created by Ryan Yao on 2017-12-13.
//  Copyright © 2017 Ryan Yao. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var cityInFull = ""
    let WEATHER_URL = "https://free-api.heweather.com/s6/weather"
    let APP_ID = "11f8312f8e9a4c529959b22a61a7d261"
    let nowWeather = NowScreenView()
    
    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mainScroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set up scroll view
        
        let xOrigin = self.view.frame.width
        
        let credit : CreditScreenView = CreditScreenView(nibName: "CreditScreenView", bundle: nil)

        mainScroll.addSubview(credit.view)

        let forcast : ForcastScreenView = ForcastScreenView(nibName: "ForcastScreenView", bundle: nil)

        mainScroll.addSubview(forcast.view)

        let now : NowScreenView = NowScreenView(nibName: "NowScreenView", bundle: nil)

        mainScroll.addSubview(now.view)
        
       
        credit.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)

        forcast.view.frame = CGRect(x: xOrigin, y: 0, width: self.view.frame.width, height: self.view.frame.height)

        now.view.frame = CGRect(x: xOrigin * 2, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        mainScroll.contentSize = CGSize(width: CGFloat(view.frame.width * 3), height: CGFloat(view.frame.height))
        mainScroll.contentOffset.x = view.frame.width * 3
        
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
                    let params : [String : String] = ["location" : self.cityInFull, "key" : self.APP_ID,]
                    self.nowWeather.getWeatherData(url: self.WEATHER_URL, parameters: params)
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
    


}

