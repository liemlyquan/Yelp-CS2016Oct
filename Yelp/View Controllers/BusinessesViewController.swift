//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Chau Vo on 10/17/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    var businesses: [Business] = []
    let searchDelay:Double  = 0.5
    var inProgress:Bool = false
    var time:DispatchTime = .now()

    override func viewDidLoad() {
        super.viewDidLoad()
        initDelegate()
        initUI()
        doSearch()
    }

    
    func initDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    func initUI(){
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 130
        navigationItem.titleView = searchBar
    }
    
    func doSearch(_ query: String? = "Thai"){
        print("query \(query)")
        let categories = YelpSearchSettings.sharedInstance.categories
        let deals = YelpSearchSettings.sharedInstance.deals
//        let sortMode = YelpSearchSettings.sharedInstance.
        
        if let query = query {
            Business.search(with: query) { (businesses: [Business]?, error: Error?) in
                if let businesses = businesses {
                    self.businesses = businesses
                    self.tableView.reloadData()
                }
            }
        }
        
        // Example of Yelp search with more search options specified
        /*
         Business.search(with: "Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]?, error: Error?) in
         if let businesses = businesses {
             self.businesses = businesses
         

             }
         }
         */
    }
}
    
    



extension BusinessesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessTableViewCell") as! BusinessTableViewCell
        cell.business = businesses[indexPath.row]
        return cell
    }
}

extension BusinessesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        time = .now()
        if let searchText = searchBar.text {
            DispatchQueue.main.asyncAfter(deadline: .now() + searchDelay, execute: {
                if (.now() - self.searchDelay > self.time){
                    self.doSearch(searchText)
                }

            })
        }
    }
}
