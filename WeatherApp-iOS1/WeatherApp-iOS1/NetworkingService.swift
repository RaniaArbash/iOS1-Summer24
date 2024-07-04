//
//  NetworkingService.swift
//  WeatherApp-iOS1
//
//  Created by Rania Arbash on 2024-07-04.
//

import Foundation


class NetworkingService {
    
  static var shared  = NetworkingService()
    
    
    func getCitiesFromAPI(searchText : String) -> [City]{
        
        
        var listOfCitiesFromAPI = [City]()
        
        var urlString = "http://gd.geobytes.com/AutoCompleteCity?&q="
        
        var task = URLSession.shared.
        
        
        
        
        return listOfCitiesFromAPI
        
        
    }
    
    
    
}
