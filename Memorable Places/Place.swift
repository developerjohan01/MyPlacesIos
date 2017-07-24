//
//  Place.swift
//  Memorable Places
//
//  Created by Johan Nilsson on 2017/07/21.
//  Copyright © 2017 Johan Nilsson. All rights reserved.
//

import UIKit
import CoreData

class Place: NSManagedObject {

    class func createPlace(_ newPlace: Place, in context: NSManagedObjectContext) throws -> Place {
        /*
         * find example - we dont need find an idividual at the moment...
         *
        let request: NSFetchRequest<Place> = Place.fetchRequest()
        request.predicate = NSPredicate(format: "id_what_you_called_it = %@", (newPlace.latitude + newPlace.longitude))
        // no sort needed if only one !
        
        do {
            let matches = try context.fetch(request)
            if matches.count > 0 {
                assert(matches.count > 1, "database inconsistent - there should only be one")
                return matches[0]
            }
        } catch {
            // Error handling
            throw error
        }
        */
 
        // create
        let place = Place(context: context)
        place.name = newPlace.name
        place.latitude = newPlace.latitude
        place.longitude = newPlace.longitude
        let currentDate = Date()
        place.created = currentDate as NSDate
        
    }
}
