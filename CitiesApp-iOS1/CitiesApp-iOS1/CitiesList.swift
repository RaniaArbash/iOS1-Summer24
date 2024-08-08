//
//  CitiesList.swift
//  CitiesApp-iOS1
//
//  Created by Rania Arbash on 2024-08-08.
//

import SwiftUI

struct CitiesList: View  {
    
    @EnvironmentObject var cityStorage : CityStorage
    var body: some View {

        NavigationStack{
            VStack{
                List(cityStorage.cities) { currentycity in
                    NavigationLink(destination: CityDetails(city: currentycity)) {
                        CityRow(city: currentycity)
                    }
                }
            }.navigationTitle("Cities").navigationBarItems(trailing:
                                                            NavigationLink(destination: AddCity(cityStorage:_cityStorage,  city: City()), label: {
                Image(systemName: "plus")
            })                   )
        }
    }
    }
//
//#Preview {
//    CitiesList(cityStorage: CityStorage())
//}
