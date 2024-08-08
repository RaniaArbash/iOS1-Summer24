//
//  City.swift
//  CitiesApp-iOS1
//
//  Created by Rania Arbash on 2024-08-08.
//

import Foundation

struct City: Identifiable {
    
    var id = UUID()
    var cityName = ""
    var countryName = ""
    var cityImage = ""
    var population : Double = 0.0
    
    init(cityName: String = "", countryName: String = "", cityImage: String = "", population: Double) {
        self.cityName = cityName
        self.countryName = countryName
        self.cityImage = cityImage
        self.population = population
    }
    init(){
        self.cityName = ""
        self.countryName = ""
        self.cityImage = ""
        self.population = 0.0
 
    }
    
}

class CityStorage: ObservableObject {
@Published var cities = [City(cityName: "Toronto", countryName: "Canada", cityImage: "toronto_img", population: 2.93),
                  City(cityName: "Montreal", countryName: "Canada", cityImage: "montreal_img", population: 1.78)
    ]
}
