//
//  HomeViewController.swift
//  Badi
//
//  Created by user on 25/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter: HomePresenter?
    @IBAction func buttonWasPressed(_ sender: Any) {
        presenter?.searchSelected()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
