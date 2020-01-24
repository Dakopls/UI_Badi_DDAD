//
//  Database.swift
//  Badi
//
//  Created by user on 24/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import Foundation

class Database {
    private var locations = [Location]()
    
    func storeLocations(content: Array<Location>) {
        locations = content
    }
    
    func getLocations() -> Array<Location> {
        return locations
    }
}
