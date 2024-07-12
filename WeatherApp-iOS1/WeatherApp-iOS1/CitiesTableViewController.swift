//
//  CitiesTableViewController.swift
//  WeatherApp-iOS1
//
//  Created by Rania Arbash on 2024-07-04.
//

import UIKit

class CitiesTableViewController: UITableViewController, UISearchBarDelegate, NetworkingServiceDelegate {
 
    var apiList = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingService.shared.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiList.count
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 2{
            NetworkingService.shared.getCitiesFromAPI(searchText: searchText)
        }
        else {
            apiList = [String]()
            tableView.reloadData()
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = apiList[indexPath.row]
        return cell
    }
    
    func networkingDidFinishWithCities(list: [String]) {
        apiList = list
        
        DispatchQueue.main.async {
            self.fromStringToCity(stringCity: list[0])
            self.tableView.reloadData()

        }
    }
    
    func fromStringToCity(stringCity: String) -> City?{
        
        if stringCity.count != 0 {
            let parts = stringCity.split(separator: ",")
            
            return City(name: String(parts[0].trimmingPrefix(" ")), state: String(parts[1].trimmingPrefix(" ")), country: String(parts[2].trimmingPrefix(" ")))
        }
        return nil
    }
    
    
    
    //071c3ffca10be01d334505630d2c1a9c
    func networkingDidFail() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Networking Error", message: "SomeThing went wrong!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(alert, animated: true)
        }
        // Name, State, Country
       
    }
    
    // Important: Don't add didSelectRow and prepareForSegue in the same view controller.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var i = tableView.indexPathForSelectedRow?.row
        var selectedCity = fromStringToCity(stringCity: apiList[i!])
        (segue.destination as! WeatherViewController).city = selectedCity
        
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
