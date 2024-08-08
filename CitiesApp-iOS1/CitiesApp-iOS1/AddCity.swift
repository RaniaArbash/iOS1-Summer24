//
//  AddCity.swift
//  CitiesApp-iOS1
//
//  Created by Rania Arbash on 2024-08-08.
//

import SwiftUI

struct AddCity: View {
    @EnvironmentObject var cityStorage : CityStorage
    @State var city: City
    @SwiftUI.Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
       
        List{
            Section("Name") {
                TextField("City Name", text: $city.cityName)
            }
            
            
            Section("Country") {
                TextField("Country Name", text: $city.countryName)
            }
        }
            Button {
                city.population = 2.4
                city.cityImage = "noimage"
                cityStorage.cities.append(city)
                self.presentationMode.wrappedValue.dismiss()
                
            } label: {
                Text("Save")
            }
        
    }
}
//
//#Preview {
//    AddCity(cityStorage: CityStorage(),city: City())
//}
