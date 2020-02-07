//
//  HomeViewController.swift
//  Badi
//
//  Created by user on 25/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIControl!
    var presenter: HomePresenter?

    @IBAction func buttonWasPressed(_ sender: Any) {
        presenter?.searchSelected()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSettings()
        
        // Do any additional setup after loading the view.
    }
    
    func buttonSettings() {
        self.startButton?.backgroundColor = UIColor.init(red:32/255, green:49/255, blue: 85/255, alpha: 1)
        self.startButton?.layer.cornerRadius = 16.0
        self.startButton?.tintColor = .white
    }

}
