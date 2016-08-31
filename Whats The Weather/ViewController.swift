//
//  ViewController.swift
//  Whats The Weather
//
//  Created by 原啓介 on 2016/08/31.
//  Copyright © 2016年 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cityTextField: UITextField!

    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func findWeather(sender: AnyObject) {
        var wasSuccessful = false
        let attemptedUrl = NSURL(string:"http://ja.weather-forecast.com/locations/" + cityTextField.text!.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")!
        if let url:NSURL = attemptedUrl {
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            if let urlContent = data{
                let webContent = NSString(data:urlContent,encoding: NSUTF8StringEncoding)
                let websiteArray = webContent?.componentsSeparatedByString("3 日間の天気予報概況:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                if websiteArray!.count > 1{
                    
                    let weatherArray = websiteArray![1].componentsSeparatedByString("</span>")
                    print(weatherArray[0])
                    if weatherArray.count > 1{
                        wasSuccessful = true
                        
                        let weatehrSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                        dispatch_async(dispatch_get_main_queue(), {
                            self.resultLabel.text = weatehrSummary
                        })
                    }
                }
            }
            if wasSuccessful == false{
                self.resultLabel.text = "都市が見つかりません。もう１度、都市名を入れてください"
            }
            }
        task.resume()
        }else{
             self.resultLabel.text = "都市が見つかりません。もう１度、都市名を入れてください"
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

