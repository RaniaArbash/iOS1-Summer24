//
//  City.swift
//  WeatherApp-iOS1
//
//  Created by Rania Arbash on 2024-07-04.
//

import Foundation

class City {
    var name: String = ""
    var state: String = ""
    var country : String = ""
    var docID: String? = nil
    
    func toString() -> String{
        return "\(name),\(state),\(country)"
    }
    
    init(name: String, state: String, country: String) {
        self.name = name
        self.state = state
        self.country = country
    }
    init(docID: String, name: String, state: String, country: String) {
        self.docID = docID
        self.name = name
        self.state = state
        self.country = country
    }
}


class WeatherObject : Decodable {
    var weather = [WeatherArray]()
    var main = MainWeather()
}

class WeatherArray: Decodable {
    var description : String = ""
    var icon = " "
}

class MainWeather : Decodable {
    var temp : Double = 0.0
    var feels_like : Double = 0.0
}


