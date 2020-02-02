//
//  DetailPresenter.swift
//  Badi
//
//  Created by user on 28/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import Foundation

class DetailPresenter {
    
    var view: DetailViewController?
    var router: Router?
    
    func backButtonPressed() {
        router?.returnRooms()
    }
//    func searchSelected() {
//        router?.pushSearch()
//    }
    
}
