//
//  NetworkingService.swift
//  WeatherApp-iOS1
//
//  Created by Rania Arbash on 2024-07-04.
//

import Foundation
import UIKit

// Option 1: send data via delegate Protocol
protocol NetworkingServiceDelegate {
    func networkingDidFinishWithCities(list:[String])
    func networkingDidFail()
}

class NetworkingService {
    
    var nname = (UIApplication.shared.delegate as! AppDelegate).myNotification

    
    var delegate : NetworkingServiceDelegate?
  static var shared  = NetworkingService()
    
    // Option 4: send data via Notification Center
    func getCitiesFromAPI(searchText : String) {
        let urlString = "http://gd.geobytes.com/AutoCompleteCity?&q=\(searchText)"
        let urlObject = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: urlObject) { data, response, error in
            
            if let isError = error {
                print (isError)
                return
            }
                // there is no error
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    print("There is incorrect response")

                    return
                }
                
                // there is a good response
                
                if let gooddata = data {
                
                   // JSONSerialization.jsonObject(with: gooddata) as! NSArray
                    
                    let decoder = JSONDecoder()
                    do{
                        let list = try decoder.decode([String].self, from: gooddata)
                        NotificationCenter.default.post(name: self.nname, object: list)
                        
                    }catch {
                        print(error)
                    }
                }
        }

        task.resume()
    }
    
    
    
    
//    func getCitiesFromAPI(searchText : String) {
//        
//        let urlString = "http://gd.geobytes.com/AutoCompleteCity?&q=\(searchText)"
//        let urlObject = URL(string: urlString)!
//        
//        let task = URLSession.shared.dataTask(with: urlObject) { data, response, error in
//            
//            if let isError = error {
//                print (isError)
//                self.delegate?.networkingDidFail()
//                return
//            }
//                // there is no error
//                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//                    print("There is incorrect response")
//                    self.delegate?.networkingDidFail()
//
//                    return
//                }
//                
//                // there is a good response
//                
//                if let gooddata = data {
//                
//                    let decoder = JSONDecoder()
//                    do{
//                        
//                        let list = try decoder.decode([String].self, from: gooddata)
//                        self.delegate?.networkingDidFinishWithCities(list: list)
//                        
//                    }catch {
//                        print(error)
//                    }
//                }
//        }
//        
//        task.resume()
//        
//        
//    }
//    //071c3ffca10be01d334505630d2c1a9c

    
    
    // Option 2: send data via completion Handler with Weather Object

//    func getWeatherInCity(c: City, completionHandler: @escaping (WeatherObject?)->Void ){
//        
//        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(c.toString())&appid=071c3ffca10be01d334505630d2c1a9c&units=metric"
//        let urlObject = URL(string: urlString)!
//        
//        let task = URLSession.shared.dataTask(with: urlObject) { data, response, error in
//            
//            if let isError = error {
//                print (isError)
//                completionHandler(nil)
//                return
//            }
//                // there is no error
//                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//                    print("There is incorrect response")
//                    completionHandler(nil)
//                    return
//                }
//                
//                // there is a good response
//                
//                if let gooddata = data {
//                
//                    let decoder = JSONDecoder()
//                    do{
//                        
//                        let weatherObject = try decoder.decode(WeatherObject.self, from: gooddata)
//                        
//                        DispatchQueue.main.async {
//                            completionHandler(weatherObject)
//                        }
//                        
//                    }catch {
//                        print(error)
//                    }
//                }
//        }
//        
//        task.resume()
//        
//    }
//    
    
    
    // Option 3: send data via completion Handler with Result Type

    func getWeatherInCity(c: City, completionHandler: @escaping (Result<WeatherObject,Error>)->Void ){
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(c.toString())&appid=071c3ffca10be01d334505630d2c1a9c&units=metric"
        let urlObject = URL(string: urlString)!
        
        
      //  URLSession.shared.dataTask(with: URLRequest())
        
        let task = URLSession.shared.dataTask(with: urlObject) { data, response, error in
            
            if let isError = error {
                print (isError)
                completionHandler(.failure(isError))
                return
            }
                // there is no error
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    print("There is incorrect response")
                    
                    completionHandler(.failure(error!))
                    return
                }
                
                // there is a good response
                
                if let gooddata = data {
                // JSONSerialization and JSONDecoder
//                    do {
//                        var jsonDic =  try JSONSerialization.jsonObject(with: gooddata) as! NSDictionary
//                       var wArray = jsonDic.value(forKey: "weather") as! NSArray
//                        var des = (wArray[0] as! NSDictionary).value(forKey: "description")
//                        
//                      var temp =  jsonDic.value(forKeyPath: "main.temp") as! Double
//                    }
//                    catch {
//                        print (error)
//                        
//                    }
                    let decoder = JSONDecoder()
                    do{
                        
                        let weatherObject = try decoder.decode(WeatherObject.self, from: gooddata)
                        
                        DispatchQueue.main.async {
                            completionHandler(.success(weatherObject))
                            //completionHandler(weatherObject)
                        }
                        
                    }catch {
                        print(error)
                    }
                }
        }
        
        task.resume()
        
    }
   
    
    
    
}
