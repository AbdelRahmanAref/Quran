//
//  PodCastSearchController.swift
//  Quran
//
//  Created by AbdelRahman Aref on 4/29/19.
//  Copyright © 2019 AbdelRahman Aref. All rights reserved.
//

import UIKit
import Alamofire

class PodCastsSearchController: UITableViewController, UISearchBarDelegate {

    var podcasts = [PodCast]()
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
        self.definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        APIService.shared.fetchPodcasts(searchText: searchText) { (podcasts) in
            self.podcasts = podcasts
            self.tableView.reloadData()
        }
    }

   

    //MARK:- UITableView
    fileprivate func setupTableView(){
        tableView.tableFooterView = UIView()
        let nib = UINib(nibName: "PodcastCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episodesController = EpisodesController()
        let podcast = self.podcasts[indexPath.row]
        episodesController.podcast = podcast
        navigationController?.pushViewController(episodesController, animated: true)
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Please enter a Search Term..."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .purple
        return label
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.podcasts.count > 0 ? 0 : 250
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PodcastCell
        let podcast = self.podcasts[indexPath.row]
        cell.podcast = podcast
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
}
