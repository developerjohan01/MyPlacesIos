//
//  PlacesTableViewController.swift
//  Memorable Places
//
//  Created by Johan Nilsson on 2017/07/20.
//  Copyright © 2017 Johan Nilsson. All rights reserved.
//

import UIKit
import CoreData

class PlacesTableViewController: UITableViewController {
    
    var container: NSPersistentContainer? = AppDelegate.persistentContainer // NOTE - using conviniance method
    
    var places: [OldPlace] = []
    
    var place: Place?
    
    var currentlySelectedPlace: OldPlace?
    
    @IBOutlet var placeTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // places = getAllPlaces()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        places = getAllPlaces()
        placeTableView.reloadData()
    }
    
    // MARK: - Data storage 
    
    private func getAllPlaces() -> [OldPlace] {
        print("getting all places")
//        container?.performBackgroundTask { context in
//            print("performBackgroundTask")
//            
//            let fetchRequest: NSFetchRequest<Place> = Place.fetchRequest()
//            let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
//            
//            )
//            
        
            //context.fetch(NSFetchRequest<NSFetchRequestResult>)
        //        }
        // TODO
//        var placeList = [Place]()
//        if let placeListObjectData = UserDefaults.standard.object(forKey: "placeList") as? Data {
//            placeList = NSKeyedUnarchiver.unarchiveObject(with: placeListObjectData) as! [Place]
//        }
//        places = placeList
        //TODO
//        let placeListObject = UserDefaults.standard.object(forKey: "placeList")
//        if (placeListObject as? [String]) != nil {
//            places = placeListObject as! [Place]
//        }
        if places.count == 0 {
            addDefaultPlacesToPlacesList()
        }
        return places
    }
    
    func savePlace(place: Place) {
        print("TODO Save")
    }
    
    func addDefaultPlacesToPlacesList() {
//        let homePlace = OldPlace()
//        homePlace.name = "Home"
//        homePlace.latitude = -33.871487
//        homePlace.longitude = 18.540468
//        places.append(homePlace)
//        
//        let workPlace = OldPlace()
//        workPlace.name = "Polymorph"
//        workPlace.latitude = -33.965431
//        workPlace.longitude = 18.835943
//        places.append(workPlace)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath)

        cell.textLabel?.text = "TODO"
        cell.detailTextLabel?.text = "TODO too"
//        cell.textLabel?.text = places[indexPath.row].name
//        let lat = places[indexPath.row].latitude
//        let lon = places[indexPath.row].longitude
//        cell.detailTextLabel?.text = "(\(String(format: "%.03f", lat)), \(String(format: "%.03f",lon)))"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        self.currentlySelectedPlace = places[indexPath.row]
//        print("willSelect \(self.currentlySelectedPlace?.name ?? "")")
        return indexPath
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currentlySelectedPlace = places[indexPath.row]
//        print("didSelect \(self.currentlySelectedPlace?.name ?? "")")
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source FIRST
            places.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)

        } /* else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    */
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let placeViewController = segue.destination as? PlaceViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "addPlace":
                    placeViewController.mapViewMode = .add
                    placeViewController.displayPlace = nil
                case "showPlace":
                    placeViewController.mapViewMode = .show
                    placeViewController.displayPlace = currentlySelectedPlace
                default:
                    print("unknown identifier")
                    break
                }
                
            }
            
        }
    }
    

}
