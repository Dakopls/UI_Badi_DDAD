//
//  Router.swift
//  Badi
//
//  Created by user on 24/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import UIKit

class Router {
    
    var home = HomeViewController()
    var search: SearchTableViewController?
    var rooms: RoomsTableViewController?
    
    init() {
        let presenter = HomePresenter()
        presenter.router = self
        self.home.presenter = presenter
    }
    
    func pushSearch() {
        print("push search")
        let presenter = SearchPresenter()
        let interactor = SearchInteractor()
        self.search = SearchTableViewController()
        self.search?.presenter = presenter
        self.search?.modalPresentationStyle = .fullScreen
        presenter.view = search
        presenter.interactor = interactor
        presenter.router = self
        interactor.presenter = presenter
        home.show(self.search!, sender: self.home)
    }
    
    func pushRooms() {
        print("push rooms")
        let presenter = RoomsPresenter()
        let interactor = RoomsInteractor()
        self.rooms = RoomsTableViewController()
        self.rooms?.presenter = presenter
        self.rooms?.modalPresentationStyle = .fullScreen
        presenter.view = rooms
        presenter.interactor = interactor
        presenter.router = self
        interactor.presenter = presenter
        search?.show(self.rooms!, sender: self.search)
    }
    
}
