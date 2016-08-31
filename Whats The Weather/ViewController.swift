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
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string:"http://ja.weather-forecast.com/locations/Tokyo-1/forecasts/latest")!
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            if let urlContent = data{
                let webContent = NSString(data:urlContent,encoding: NSUTF8StringEncoding)
                let websiteArray = webContent?.componentsSeparatedByString("3 日間の天気予報概況:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                if websiteArray!.count >= 1{
                    
                 let weatherArray = websiteArray![1].componentsSeparatedByString("</span>")
                     print(weatherArray[0])
                    if weatherArray.count > 1{
                let weatehrSummary = weatherArray[0]
                }
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

