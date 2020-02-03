//
//  DetailViewController.swift
//  Badi
//
//  Created by user on 28/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var bio: UILabel!

    var presenter: DetailPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchRoomDetail()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.presenter?.backButtonPressed()
    }

}

// MARK: - Protocols
extension DetailViewController: ViewProtocol {
    func populate<T>(content: T) {
        print("pop detail")
        let room_detail = content as! RoomDetail
        self.name?.text = room_detail.title
        self.price?.text = room_detail.price
        self.desc?.text = room_detail.description
    }
}
