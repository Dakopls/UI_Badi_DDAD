//
//  RoomsTableViewController.swift
//  Badi
//
//  Created by user on 25/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import UIKit

class RoomsTableViewController: UITableViewController {

    // MARK: - Properties
    var presenter = RoomsPresenter()
    private var rooms = [Room]()
    weak var cellDelegate: CellUtilsDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cellDelegate = self
        tableSettings()
    }
    
    // MARK: - Setups
    func tableSettings() {
        self.tableView.register(UINib(nibName: "RoomTableViewCell", bundle: nil), forCellReuseIdentifier: "RoomTableViewCell")
        self.tableView.allowsSelection = true
        self.tableView.rowHeight = 254
        self.tableView.separatorStyle = .none
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTableViewCell", for: indexPath) as! RoomTableViewCell
        
        let room = self.rooms[indexPath.row]
        cell.name?.text = room.name
        cell.price?.text = String(room.price)
        cell.contentView.backgroundColor = .white
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        let room = self.rooms[indexPath.row]
        cellDelegate?.cellDidSelect(cell, with: room)
    }
}

// MARK: - Protocols
extension RoomsTableViewController: ViewProtocol {
    func populate<T>(content: Array<T>) {
        print("populate rooms")
        self.rooms = content as! [Room]
        self.tableView.reloadData()
    }
}

// MARK: - Delegates
extension RoomsTableViewController: CellUtilsDelegate {
    func cellDidSelect<T>(_ cell: UITableViewCell, with content: T) {
        let room = content as! Room
        print("selected room: " + String(room.id))
        self.presenter.roomSelected(id: room.id)
    }
}
