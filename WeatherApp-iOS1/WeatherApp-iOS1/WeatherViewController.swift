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
        self.title = city?.toString()
        NetworkingService.shared.getWeatherInCity(c: city!) { result in
            switch result {
                
            case .success(let goodWO):
               
                    self.tempText.text = "\( goodWO.main.temp)"
                    self.descText.text = goodWO.weather[0].description
                    self.feelsLike.text = "\( goodWO.main.feels_like)"
                    self.downloadImage(icon: goodWO.weather[0].icon)
                            
                    break
                
            case .failure(let error):
                print (error)
                self.tempText.text = "NO data availalbe"
                self.descText.text = "NO data availalbe"
                self.feelsLike.text = "NO data availalbe"
                break
                
            }
            
            
        }
        
        //{ weatherObj in
//            if let goodWO = weatherObj {
//                self.tempText.text = "\( goodWO.main.temp)"
//                self.descText.text = goodWO.weather[0].description
//                self.feelsLike.text = "\( goodWO.main.feels_like)"
//                
//                self.downloadImage(icon: goodWO.weather[0].icon)
//               
//                
//                
//            }else {
//                
//                self.tempText.text = "NO data availalbe"
//                self.descText.text = "NO data availalbe"
//                self.feelsLike.text = "NO data availalbe"
//                
//            }
//        }
    }
    

    func downloadImage(icon: String){
       
          let myQ = DispatchQueue(label: "myQ")
            myQ.async {
             
                do {
                    let imageData = try Data(contentsOf: URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")! )
                    DispatchQueue.main.async {
                        self.weatherIcon.image = UIImage(data: imageData)
                    }
                    
                } catch {
                    print(error)
                }
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
