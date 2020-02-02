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
    var search: SearchViewController?
    var rooms: RoomsViewController?
    var detail: DetailViewController?
    
    init() {
        let presenter = HomePresenter()
        presenter.view = self.home
        presenter.router = self
        self.home.presenter = presenter
    }
    
    func pushSearch() {
        print("Router> push search")
        let presenter = SearchPresenter()
        let interactor = SearchInteractor()
        self.search = SearchViewController()
        self.search?.presenter = presenter
        self.search?.modalPresentationStyle = .fullScreen
        presenter.view = self.search
        presenter.interactor = interactor
        presenter.router = self
        interactor.presenter = presenter
        home.show(self.search!, sender: self.home)
    }
    
    func pushRooms(location: Location) {
        print("Router> push rooms")
        let presenter = RoomsPresenter()
        let interactor = RoomsInteractor()
        self.rooms = RoomsViewController()
        self.rooms?.presenter = presenter
        self.rooms?.modalPresentationStyle = .fullScreen
        presenter.view = rooms
        presenter.interactor = interactor
        presenter.router = self
        interactor.presenter = presenter
        interactor.bounds = location.boundingbox
        search?.show(self.rooms!, sender: self.search)
    }
    
    func pushDetail() {
        print("Router> push detail")
        self.detail = DetailViewController()
        let presenter = DetailPresenter()
        presenter.router = self
        self.detail?.presenter = presenter
        self.detail?.modalPresentationStyle = .fullScreen
        rooms?.show(self.detail!, sender: self.rooms)
    }
    
    func returnHome() {
        print("Router> return home")
        self.home.dismiss(animated: true, completion: nil)
    }
    
    func returnSearch() {
        print("Router> return search")
        self.search?.dismiss(animated: true, completion: nil)
    }
    
    func returnRooms() {
        print("Router> return rooms")
        self.rooms?.dismiss(animated: true, completion: nil)
    }
    
}
