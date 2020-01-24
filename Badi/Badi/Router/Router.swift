//
//  Router.swift
//  Badi
//
//  Created by user on 24/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import UIKit

class Router {
    let viewController = SearchTableViewController()
    var presenter = Presenter()
    let interactor = Interactor()
    
    init() {
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = self
        interactor.presenter = presenter
    }
}
