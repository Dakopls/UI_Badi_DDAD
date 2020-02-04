//
//  RoomsViewController.swift
//  Badi
//
//  Created by user on 25/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import UIKit
import Kingfisher

class RoomsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Properties
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var backButton: UIControl!
    @IBOutlet weak var locationSearched: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var presenter: RoomsPresenter?
    private var rooms = [Room]()
    weak var cellDelegate: CellUtilsDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cellDelegate = self
        buttonSettings()
        tableSettings()
        presenter?.fetchRooms()
    }
    
    // MARK: - Setups
    func buttonSettings() {
        self.locationSearched.text = presenter?.getLocationName()
        self.backButton.backgroundColor = UIColor.init(red:239/255, green:239/255, blue: 241/255, alpha: 1)
        self.backButton.layer.cornerRadius = 8.0
        self.backButton.tintColor = .black
        //self.backButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 240)
    }
    
    func tableSettings() {
        self.tableView.register(UINib(nibName: "RoomTableViewCell", bundle: nil), forCellReuseIdentifier: "RoomTableViewCell")
        self.tableView.allowsSelection = true
        self.tableView.rowHeight = 272
        self.tableView.separatorStyle = .none
    }

    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int
    {
        var sections = 0
        if self.rooms.count > 0 {
            sections = 1
            self.tableView.backgroundView = nil
        }
        else {
            let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLabel.text = "No rooms available in this location"
            noDataLabel.textColor = UIColor.lightGray
            noDataLabel.textAlignment = .center
            self.tableView.backgroundView = noDataLabel
        }
        return sections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTableViewCell", for: indexPath) as! RoomTableViewCell
        
        let room = self.rooms[indexPath.row]
        cell.photo?.kf.setImage(with: URL(string: room.photos[0].url_small!))
        cell.name?.text = room.title
        cell.price?.text = room.price
        cell.owner?.text = room.owner.display
        cell.contentView.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        let room = self.rooms[indexPath.row]
        cellDelegate?.cellDidSelect(cell, with: room)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.presenter?.backButtonPressed()
    }
    
}

// MARK: - Protocols
extension RoomsViewController: ViewProtocol {
    func populate<T>(content: T) {
        //print("ViewProtocol> populate rooms")
        self.rooms = content as! [Room]
        self.tableView.reloadData()
    }
}

// MARK: - Delegates
extension RoomsViewController: CellUtilsDelegate {
    func cellDidSelect<T>(_ cell: UITableViewCell, with content: T) {
        let room = content as! Room
        //print("CellSelected> room: " + room.id)
        self.presenter?.roomSelected(id: room.id)
    }
}
