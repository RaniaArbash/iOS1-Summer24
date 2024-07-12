//
//  WeatherViewController.swift
//  WeatherApp-iOS1
//
//  Created by Rania Arbash on 2024-07-12.
//

import UIKit

class WeatherViewController: UIViewController {

    
    @IBOutlet weak var weatherIcon: UIImageView!
    
    
    @IBOutlet weak var descText: UILabel!
    
    
    @IBOutlet weak var feelsLike: UILabel!
    
    @IBOutlet weak var tempText: UILabel!
    
    var city: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingService.shared.getWeatherInCity(c: city!) { weatherObj in
            self.tempText.text = "\( weatherObj.main.temp)"
            self.descText.text = weatherObj.weather[0].description
            self.feelsLike.text = "\( weatherObj.main.feels_like)"
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
