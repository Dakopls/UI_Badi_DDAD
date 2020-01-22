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
    //private let dataRetriever = URLSessionDataRetriever()
    private var locationList: Array<Location> = []
    private var provider = LocationProvider()
    
    private let screenRect = UIScreen.main.bounds
    private var searchController: UISearchController!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSettings()
        searhBarSettings()
    }
    
    // MARK: - Setups
    func tableSettings() {
        self.tableView.register(UINib(nibName: "LocationTableViewCell", bundle: nil), forCellReuseIdentifier: "LocationTableViewCell")
        self.tableView.allowsSelection = true
    }
    
    func searhBarSettings() {
        self.searchController = UISearchController(searchResultsController: self)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
        self.searchController.searchBar.placeholder = "Search Location"
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return provider.rows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell", for: indexPath) as! LocationTableViewCell
        
        let contentModel = provider.row(at: indexPath)
        cell.name?.text = contentModel.name
        cell.type?.text = contentModel.type
        cell.contentView.backgroundColor = .white
        return cell
    }
}

extension SearchTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
        if (self.searchController.searchBar.text!.count < 3) { return }
        provider.updateLocations()
        self.tableView.reloadData()
    }
}
