//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Chau Vo on 10/17/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import UIKit
import CoreLocation

class BusinessesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    var businesses: [Business] = []
    let searchDelay:Double  = 0.5
    var inProgress:Bool = false
    var time:DispatchTime = .now()
    let manager = CLLocationManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        initDelegate()
        requestLocation()

        
        

    }

    
    func initDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        manager.delegate = self

    }
    
    func initUI(){
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 130
        navigationItem.titleView = searchBar
    }
    
    func requestLocation(){
        switch (CLLocationManager.authorizationStatus()) {
        case .authorizedWhenInUse:
            manager.startUpdatingLocation()

        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        default: break
        }
        
    }
    
    func doSearch(_ query: String? = "Thai"){
        self.businesses = []
        let settings = YelpSearchSettings.sharedInstance
        let categories = settings.categories
        let deals = settings.deals
        let distance = settings.distance
        let sortByMode = settings.sortBy
        
        if let query = query {
            Business.search(with: query, sort: sortByMode , categories: categories, deals: deals, radiusFilter: distance) { (businesses: [Business]?, error: Error?) in
                if let businesses = businesses {
                    self.businesses = businesses
                    self.tableView.reloadData()
                    
                    
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BusinessesToFilterSegue" {
            if let nvc = segue.destination as? UINavigationController, let filterVC = nvc.topViewController as? FilterViewController {
                filterVC.delegate = self
            }
        }
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

extension BusinessesViewController: FilterViewControllerDelegate {
    func updateSettings(_ searchViewController: FilterViewController) {
        doSearch(searchBar.text)
    }
}

extension BusinessesViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var locValue:CLLocationCoordinate2D = manager.location!.coordinate
        YelpSearchSettings.sharedInstance.location = "\(locValue.latitude),\(locValue.longitude)"
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        initUI()
        doSearch()
    }
}


