//
//  DataRetriver.swift
//  Badi
//
//  Created by user on 02/02/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import Foundation

protocol DataRetriever {
    func retrieve<T: Codable>(url: String, method: String, _ completionBlock: @escaping (Result<T, Error>) -> Void)
}

extension DataRetriever {
    //així podem definir que per defecte utilitzarem el mètode get (les extensions son per a això)
    func retrieve<T: Codable>(url: String,
                              method: String = "GET",
                              _ completionBlock: @escaping (Result<T, Error>) -> Void) {
        self.retrieve(url: url, method: method, completionBlock)
        
    }
}
