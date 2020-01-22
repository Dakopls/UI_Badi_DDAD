//
//  NetworkContentProvider.swift
//  Christmapps
//
//  Created by user on 09/01/2020.
//  Copyright © 2020 Atlabs. All rights reserved.
//

import Foundation

protocol LocationContentProvider {
    func rows() -> Int
    func row(at indexPath: IndexPath) -> Location
}

struct LocationProvider: LocationContentProvider {
    var content: Array<Location> = []
    
    mutating func updateLocations() {
        self.content.append(Location(id: 1, name: "Gràcia", type: "Neighborhood"))
        self.content.append(Location(id: 2, name: "Enric Granados", type: "Street"))
        self.content.append(Location(id: 3, name: "Granada", type: "City"))
    }
    
    func rows() -> Int {
        if content.count < 1 {return 0}
        return content.count
    }
    
    func row(at indexPath: IndexPath) -> Location {
        return content[indexPath.row]
    }
}
