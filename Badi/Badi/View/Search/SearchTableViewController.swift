//
//  SearchTableViewController.swift
//  Badi
//
//  Created by user on 20/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {

    // MARK: - Properties
    var presenter: Presenter?
    private var locations = [Location]()
    private var searchBar: UISearchBar!
    weak var cellDelegate: CellUtilsDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cellDelegate = self
        tableSettings()
        searchBarSettings()
    }
    
    // MARK: - Setups
    func tableSettings() {
        self.tableView.register(UINib(nibName: "LocationTableViewCell", bundle: nil), forCellReuseIdentifier: "LocationTableViewCell")
        self.tableView.allowsSelection = true
        self.tableView.rowHeight = 68
        self.tableView.separatorStyle = .none
    }
    
    func searchBarSettings() {
        self.searchBar = UISearchBar(frame: CGRect(x: 20, y: 20, width: UIScreen.main.bounds.size.width, height: 60))
        self.tableView.tableHeaderView = self.searchBar
        self.searchBar.placeholder = "Search Location"
        self.searchBar.delegate = self
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        var sections = 0
        if self.locations.count > 0 {
            sections = 1
            self.tableView.backgroundView = nil
        }
        else {
            let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLabel.text = "No locations available"
            noDataLabel.textColor = UIColor.lightGray
            noDataLabel.textAlignment = .center
            self.tableView.backgroundView = noDataLabel
        }
        return sections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell", for: indexPath) as! LocationTableViewCell
        
        let location = self.locations[indexPath.row]
        cell.name?.text = location.name
        cell.kind?.text = location.kind
        cell.contentView.backgroundColor = .white
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        let location = self.locations[indexPath.row]
        cellDelegate?.cellDidSelect(cell, with: location)
    }
}

// MARK: - Protocols
extension SearchTableViewController: ViewProtocol {
    func populate<T>(content: Array<T>) {
        print("populate Locations")
        self.locations = content as! [Location]
        self.tableView.reloadData()
    }
}

// MARK: - Delegates
extension SearchTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count < 3 { return }
        self.presenter?.fetchLocations(input: searchText)
    }
}

extension SearchTableViewController: CellUtilsDelegate {
    func cellDidSelect<T>(_ cell: UITableViewCell, with content: T) {
        let location = content as! Location
        print("get roomList for location:" + String(location.id))
        self.presenter?.locationSelected(id: location.id)
    }
}
