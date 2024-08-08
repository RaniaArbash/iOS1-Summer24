//
//  CityRow.swift
//  CitiesApp-iOS1
//
//  Created by Rania Arbash on 2024-08-08.
//

import SwiftUI

struct CityRow: View {
    var city: City
    var body: some View {
        HStack{
            Image(city.cityImage).resizable().aspectRatio(contentMode: .fit).clipShape(Circle()).background(Circle()).frame(width: 150)
            Text(city.cityName).font(.largeTitle)
            Spacer()
        }
    }
}

#Preview {
    CityRow(city: City(cityName:"Toronto",countryName:"Canada",cityImage: "toronto_img",population: 2.9)).previewLayout(.fixed(width: 300, height: 100))
    
}
