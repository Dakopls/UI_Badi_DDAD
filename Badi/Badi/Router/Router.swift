//
//  Router.swift
//  Badi
//
//  Created by user on 24/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import UIKit

class Router {
    let searchView = SearchTableViewController()
//    let searchVC: SearchTableViewController?
//    let roomsVC: RoomsTableViewController?
    
    var presenter = Presenter()
    let interactor = Interactor()
    
    init() {
        self.searchView.presenter = self.presenter        
        self.presenter.view = searchView
        self.presenter.interactor = self.interactor
        self.presenter.router = self
        self.interactor.presenter = self.presenter
    }
    
    func pushRooms() {
        print("push rooms")
        //self.roomsVC.presenter = self.presenter
    }
}
