//
//  FirestoreManager.swift
//  WeatherApp-iOS1
//
//  Created by Rania Arbash on 2024-08-01.
//

import Foundation


import FirebaseCore
import FirebaseFirestore


protocol fireStoreDelegateProtocol {
    func firestoreFinishDownlaodingTheCities(FBCities: [City])
}

class FirestoreManager {
    
   static var shared = FirestoreManager()
    
    let db = Firestore.firestore()
   
    var delegate : fireStoreDelegateProtocol? = nil
    
    func addCityToFirestore(city: City){
        let citiesRef = db.collection("Cities")
        citiesRef.document().setData(
            ["name": city.name,
             "state": city.state,
             "country" : city.country
            ])
        
    }
    
    
    
    func getAllFavCities(){
        var cities = [City]()
        
        db.collection("Cities").getDocuments(completion: {
            (snapshot, error) in
            if let e = error {
                print(e)
                return
            }
            var docs = snapshot!.documents
            for doc in docs {
                var id = doc.documentID
                let n = doc.data()["name"]
                let s = doc.data()["state"]
                let c = doc.data()["country"]
                let city = City(docID: id as! String, name: n as! String, state: s as! String, country: c as! String)
                cities.append(city)
            }
            self.delegate?.firestoreFinishDownlaodingTheCities(FBCities: cities)
        })
       
    }
    
    
    func deleteOnCity(docID: String) {
        
        do {
            db.collection("Cities").document(docID).delete()
            
           // try await db.collection("cities").delete()
          print("Document successfully removed!")
        } catch {
          print("Error removing document: \(error)")
        }
    }
//        db.collection("Cities").getDocuments { (snapshot, error) in
//            if let e = error {
//                print(e)
//                return
//            }
//            
//            var docs = snapshot!.documents
//            for doc in docs {
//                var n = doc.data()["name"]
//                var s = doc.data()["state"]
//                var c = doc.data()["country"]
//                var city = City(name: n, state: s, country: c)
//                cities.append(city)
//            }
//        }
//        
//        
//        
//    }
}
