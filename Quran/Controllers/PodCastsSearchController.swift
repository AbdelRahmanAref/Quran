//
//  PodCastSearchController.swift
//  Quran
//
//  Created by AbdelRahman Aref on 4/29/19.
//  Copyright © 2019 AbdelRahman Aref. All rights reserved.
//

import UIKit

class PodCastsSearchController: UITableViewController, UISearchBarDelegate {

    let podcasts = [
        PodCast(name: "Al baqarah", artistName: "Maher Al meaqly"),
        PodCast(name: "Al sajdah", artistName: "Raad Al Kordy"),
        PodCast(name: "Al haj", artistName: "Mishary Rashid")
    ]
    let cellId = "cellId"

    //UISearchController
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()

    }
    //MARK:- setup work

    fileprivate func setupSearchBar(){
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         print(searchText)
        //later implement Alamofire to search the API

    }
    //MARK:- UITableView
    fileprivate func setupTableView(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let podcast = self.podcasts[indexPath.row]
        cell.textLabel?.text = "\(podcast.name)\n\(podcast.artistName)"
        cell.textLabel?.numberOfLines = 0
        cell.imageView?.image = #imageLiteral(resourceName: "user")
        return cell
    }

}
