//
//  NetworkingService.swift
//  WeatherApp-iOS1
//
//  Created by Rania Arbash on 2024-07-04.
//

import Foundation


protocol NetworkingServiceDelegate {
    
    func networkingDidFinishWithCities(list:[String])
    func networkingDidFail()
    
}

class NetworkingService {
    
    var delegate : NetworkingServiceDelegate?
  static var shared  = NetworkingService()

    func getCitiesFromAPI(searchText : String) {
        
        let urlString = "http://gd.geobytes.com/AutoCompleteCity?&q=\(searchText)"
        let urlObject = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: urlObject) { data, response, error in
            
            if let isError = error {
                print (isError)
                self.delegate?.networkingDidFail()
                return
            }
                // there is no error
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    print("There is incorrect response")
                    self.delegate?.networkingDidFail()

                    return
                }
                
                // there is a good response
                
                if let gooddata = data {
                
                    let decoder = JSONDecoder()
                    do{
                        
                        let list = try decoder.decode([String].self, from: gooddata)
                        self.delegate?.networkingDidFinishWithCities(list: list)
                        
                    }catch {
                        print(error)
                    }
                }
        }
        
        task.resume()
        
        
    }
    //071c3ffca10be01d334505630d2c1a9c

    
    func getWeatherInCity(c: City){
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(c.toString())&appid=071c3ffca10be01d334505630d2c1a9c"
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
                
                    let decoder = JSONDecoder()
                    do{
                        
                        let weatherObject = try decoder.decode(WeatherObject.self, from: gooddata)
                      
                        print("\(weatherObject.main.temp)")
                        
                    }catch {
                        print(error)
                    }
                }
        }
        
        task.resume()
        
        
        
        
    }
    
    
    
    
    
}
