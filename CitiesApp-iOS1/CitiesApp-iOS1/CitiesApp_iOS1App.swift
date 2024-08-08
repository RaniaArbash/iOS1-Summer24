//
//  CitiesApp_iOS1App.swift
//  CitiesApp-iOS1
//
//  Created by Rania Arbash on 2024-08-08.
//

import SwiftUI

@main
struct CitiesApp_iOS1App: App {

    var body: some Scene {
        WindowGroup {
            
            CitiesList().environmentObject(CityStorage())
            
        }
    }
}
