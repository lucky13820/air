//
//  CreditScreenView.swift
//  air
//
//  Created by Ryan Yao on 2017-12-13.
//  Copyright © 2017 Ryan Yao. All rights reserved.
//

import UIKit


class CreditScreenView: UIViewController {
    
    
    @IBOutlet weak var purpleBg: UIButton!
    @IBOutlet weak var yellowBg: UIButton!
    @IBOutlet weak var blueBg: UIButton!
    @IBOutlet weak var greenBg: UIButton!
    @IBOutlet var redBg: UIButton!
    @IBOutlet var weatherButton: UIButton!
    @IBOutlet var twitterButton: UIButton!
    @IBOutlet var weiboButton: UIButton!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        weiboButton.setTitle("微\n博", for: .normal)
        twitterButton.setTitle("推\n特", for: .normal)
        weatherButton.setTitle("天\n氣\n來\n源\n：\n和\n風\n天\n氣", for: .normal)
        
        
        self.view.accessibilityElements = [
            self.weiboButton, self.twitterButton,self.weatherButton,
        ];
        

        
        
    }
    
//    @IBAction func greenBg(_ sender: UIButton) {
//        self.view.backgroundColor = UIColor(red:0.33, green:0.56, blue:0.60, alpha:1.0)
//        NowScreenView().changeBgColor()
//    }
//
//    @IBAction func redBg(_ sender: Any) {
//        let bgColor = "#D42D57"
//        self.view.backgroundColor = UIColor().HexToColor(hexString: bgColor, alpha: 1.0)
//    }
    
    
    
    
    
    @IBAction func weatherButton(_ sender: UIButton) {
        
        let urlString = "https://www.heweather.com"
        if let url = URL(string: urlString) {
            //根据iOS系统版本，分别处理
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:],
                                          completionHandler: {
                                            (success) in
                })
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        
    }
    
    @IBAction func twitterButton(_ sender: UIButton) {
        
        let urlString = "https://twitter.com/lucky13820"
        if let url = URL(string: urlString) {
            //根据iOS系统版本，分别处理
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:],
                                          completionHandler: {
                                            (success) in
                })
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        
    }
    
    @IBAction func weiboButton(_ sender: UIButton) {
        
        let urlString = "https://weibo.com/1627222655"
        if let url = URL(string: urlString) {
            //根据iOS系统版本，分别处理
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:],
                                          completionHandler: {
                                            (success) in
                })
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}
