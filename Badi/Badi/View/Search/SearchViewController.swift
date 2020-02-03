//
//  SearchViewController.swift
//  Badi
//
//  Created by user on 20/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Properties
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var presenter: SearchPresenter?
    private var locations = [Location]()
    weak var cellDelegate: CellUtilsDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cellDelegate = self
        self.searchBar.delegate = self
        headerSettings()
        tableSettings()
    }
    
    // MARK: - Setups
    func tableSettings() {
        self.tableView.register(UINib(nibName: "LocationTableViewCell", bundle: nil), forCellReuseIdentifier: "LocationTableViewCell")
        self.tableView.allowsSelection = true
        self.tableView.rowHeight = 68
        self.tableView.separatorStyle = .none
    }
    
    func headerSettings() {
        self.searchBar.searchBarStyle = .minimal
    }

    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell", for: indexPath) as! LocationTableViewCell
        
        let location = self.locations[indexPath.row]
        cell.name?.text = location.display_name
        cell.kind?.text = location.city
        cell.contentView.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        let location = self.locations[indexPath.row]
        cellDelegate?.cellDidSelect(cell, with: location)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.presenter?.cancelButtonPressed()
    }

}

// MARK: - Protocols
extension SearchViewController: ViewProtocol {
    func populate<T>(content: T) {
        self.locations = content as! [Location]
        self.tableView.reloadData()
    }
}

// MARK: - Delegates
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count < 3 { return }
//        print("SearchDelegate> fetch locations")
        self.presenter?.fetchLocations(input: searchText)
    }
}

extension SearchViewController: CellUtilsDelegate {
    func cellDidSelect<T>(_ cell: UITableViewCell, with content: T) {
        let location = content as! Location
        self.presenter?.locationSelected(location: location)
    }
}
