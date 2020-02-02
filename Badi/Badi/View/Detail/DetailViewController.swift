//
//  DetailViewController.swift
//  Badi
//
//  Created by user on 28/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var Photo: UIImageView!
    
    
    var presenter: DetailPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.presenter?.backButtonPressed()
    }

}
