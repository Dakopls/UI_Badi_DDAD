//
//  HomePresenter.swift
//  Badi
//
//  Created by user on 25/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

class HomePresenter {
    
    var view: HomeViewController?
    var router: Router?
    
    func searchSelected() {
        router?.pushSearch()
    }
    
}
