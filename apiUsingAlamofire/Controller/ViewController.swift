//
//  ViewController.swift
//  apiUsingAlamofire
//
//  Created by clerin binil on 29/07/19.
//  Copyright © 2019 clerin binil. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var tempLabel: UILabel!
    
    let APP_ID = "46dcbadc12410a494a27c6845bc1d9a6"
    let api_URL = "http://api.openweathermap.org/data/2.5/weather"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func searchBtnPressed(_ sender: UIButton) {
        let city = cityTextField.text!
        let params : [String:String] = ["appid":APP_ID,"q":city]
        getWeatherData(url : api_URL , p : params)
    }
    
    // function for implementing api call
    
    func getWeatherData(url:String , p : [String:String]) {
        
        Alamofire.request(url,method: .get,parameters: p).responseJSON  { (response) in
            
            if response.result.isSuccess {
                print("Got weather Data ")
                let weatherData : JSON = JSON(response.result.value!)
                print(weatherData)
                let temp = weatherData["weather"][0]["description"].stringValue
               print(temp)
                self.tempLabel.text = "\(temp)"
            }
            else {
                print("\(response.result.error) Something wrong!!")
            }
        }
        
        
        
    }
    
    
    
}

