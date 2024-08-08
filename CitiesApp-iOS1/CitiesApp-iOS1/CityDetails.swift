//
//  ContentView.swift
//  CitiesApp-iOS1
//
//  Created by Rania Arbash on 2024-08-08.
//

import SwiftUI

struct CityDetails: View {
    var city: City
    var body: some View {
        VStack{
            Image(city.cityImage).resizable().aspectRatio(contentMode: .fit)
            Text(city.cityName).fontWeight(.heavy).font(.system(size: 50))
            Text (city.countryName).fontWeight(.heavy).font(.system(size: 35))
            Text(String( city.population)).fontWeight(.heavy).font(.system(size: 35))
            Spacer()
           
        }.ignoresSafeArea()
    }
}

//#Preview {
//    
//    CityDetails(city: cities[1])
//                   
//}


