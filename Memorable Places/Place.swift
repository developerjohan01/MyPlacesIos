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

    class func createPlace(_ place: OldPlace, in context: NSManagedObjectContext) throws -> Place {
        /*
         * find example - we dont need find an idividual at the moment...
         *
        let request: NSFetchRequest<Place> = Place.fetchRequest()
        request.predicate = NSPredicate(format: "id_what_you_called_it = %@", (newPlace.latitude + newPlace.longitude))
        // no sort needed if only one !
        
        do {
            let matches = try context.fetch(request)
            if matches.count > 0 {
                assert(matches.count == 1, "database inconsistent - there should only be one")
                return matches[0]
            }
        } catch {
            // Error handling
            throw error
        }
        */
 
        // create
        let newPlace = Place(context: context)
        newPlace.name = place.name
        newPlace.latitude = place.latitude
        newPlace.longitude = place.longitude
        let currentDate = Date()
        newPlace.created = currentDate as NSDate
        return newPlace
    }
}
