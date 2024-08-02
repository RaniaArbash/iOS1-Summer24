//
//  FavTableViewController.swift
//  WeatherApp-iOS1
//
//  Created by Rania Arbash on 2024-08-01.
//

import UIKit



class FavTableViewController: UITableViewController , fireStoreDelegateProtocol{
   
    var cities = [City]()
    override func viewDidLoad()  {
        super.viewDidLoad()
        FirestoreManager.shared.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        FirestoreManager.shared.getAllFavCities()
    }
    
    func firestoreFinishDownlaodingTheCities(FBCities: [City]) {
        // reload the table
        cities = FBCities
        tableView.reloadData()
        
       // FirestoreManager.shared.deleteOnCity(docID: cities[0].docID!)
    }
    

    func fromStringToCity(stringCity: String) -> City?{
        
        if stringCity.count != 0 {
            let parts = stringCity.split(separator: ",")
            
            return City(name: String(parts[0].trimmingPrefix(" ")), state: String(parts[1].trimmingPrefix(" ")), country: String(parts[2].trimmingPrefix(" ")))
        }
        return nil
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toadd" {
          
        }else {
            let i = tableView.indexPathForSelectedRow?.row
            let selectedCity = cities[i!]
            (segue.destination as! WeatherViewController).city = selectedCity
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        
        cell.textLabel?.text = cities[indexPath.row].toString()
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
