//
//  FilterViewController.swift
//  Yelp
//
//  Created by Liem Ly Quan on 10/19/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import UIKit

@objc protocol FilterViewControllerDelegate {
    @objc optional func updateSettings(_ searchViewController: FilterViewController)
}

class FilterViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    enum filterCellType: Int {
        case deal = 0, distance, sort, category
    }
    
    weak var delegate: FilterViewControllerDelegate?
    let sortOption:[String] = []
    
    let categories:[[String:String]] =
        [["name" : "Afghan", "code": "afghani"],
         ["name" : "African", "code": "african"],
         ["name" : "American, New", "code": "newamerican"],
         ["name" : "American, Traditional", "code": "tradamerican"],
         ["name" : "Arabian", "code": "arabian"],
         ["name" : "Argentine", "code": "argentine"],
         ["name" : "Armenian", "code": "armenian"],
         ["name" : "Asian Fusion", "code": "asianfusion"],
         ["name" : "Asturian", "code": "asturian"],
         ["name" : "Australian", "code": "australian"],
         ["name" : "Austrian", "code": "austrian"],
         ["name" : "Baguettes", "code": "baguettes"],
         ["name" : "Bangladeshi", "code": "bangladeshi"],
         ["name" : "Barbeque", "code": "bbq"],
         ["name" : "Basque", "code": "basque"],
         ["name" : "Bavarian", "code": "bavarian"],
         ["name" : "Beer Garden", "code": "beergarden"],
         ["name" : "Beer Hall", "code": "beerhall"],
         ["name" : "Beisl", "code": "beisl"],
         ["name" : "Belgian", "code": "belgian"],
         ["name" : "Bistros", "code": "bistros"],
         ["name" : "Black Sea", "code": "blacksea"],
         ["name" : "Brasseries", "code": "brasseries"],
         ["name" : "Brazilian", "code": "brazilian"],
         ["name" : "Breakfast & Brunch", "code": "breakfast_brunch"],
         ["name" : "British", "code": "british"],
         ["name" : "Buffets", "code": "buffets"],
         ["name" : "Bulgarian", "code": "bulgarian"],
         ["name" : "Burgers", "code": "burgers"],
         ["name" : "Burmese", "code": "burmese"],
         ["name" : "Cafes", "code": "cafes"],
         ["name" : "Cafeteria", "code": "cafeteria"],
         ["name" : "Cajun/Creole", "code": "cajun"],
         ["name" : "Cambodian", "code": "cambodian"],
         ["name" : "Canadian", "code": "New)"],
         ["name" : "Canteen", "code": "canteen"],
         ["name" : "Caribbean", "code": "caribbean"],
         ["name" : "Catalan", "code": "catalan"],
         ["name" : "Chech", "code": "chech"],
         ["name" : "Cheesesteaks", "code": "cheesesteaks"],
         ["name" : "Chicken Shop", "code": "chickenshop"],
         ["name" : "Chicken Wings", "code": "chicken_wings"],
         ["name" : "Chilean", "code": "chilean"],
         ["name" : "Chinese", "code": "chinese"],
         ["name" : "Comfort Food", "code": "comfortfood"],
         ["name" : "Corsican", "code": "corsican"],
         ["name" : "Creperies", "code": "creperies"],
         ["name" : "Cuban", "code": "cuban"],
         ["name" : "Curry Sausage", "code": "currysausage"],
         ["name" : "Cypriot", "code": "cypriot"],
         ["name" : "Czech", "code": "czech"],
         ["name" : "Czech/Slovakian", "code": "czechslovakian"],
         ["name" : "Danish", "code": "danish"],
         ["name" : "Delis", "code": "delis"],
         ["name" : "Diners", "code": "diners"],
         ["name" : "Dumplings", "code": "dumplings"],
         ["name" : "Eastern European", "code": "eastern_european"],
         ["name" : "Ethiopian", "code": "ethiopian"],
         ["name" : "Fast Food", "code": "hotdogs"],
         ["name" : "Filipino", "code": "filipino"],
         ["name" : "Fish & Chips", "code": "fishnchips"],
         ["name" : "Fondue", "code": "fondue"],
         ["name" : "Food Court", "code": "food_court"],
         ["name" : "Food Stands", "code": "foodstands"],
         ["name" : "French", "code": "french"],
         ["name" : "French Southwest", "code": "sud_ouest"],
         ["name" : "Galician", "code": "galician"],
         ["name" : "Gastropubs", "code": "gastropubs"],
         ["name" : "Georgian", "code": "georgian"],
         ["name" : "German", "code": "german"],
         ["name" : "Giblets", "code": "giblets"],
         ["name" : "Gluten-Free", "code": "gluten_free"],
         ["name" : "Greek", "code": "greek"],
         ["name" : "Halal", "code": "halal"],
         ["name" : "Hawaiian", "code": "hawaiian"],
         ["name" : "Heuriger", "code": "heuriger"],
         ["name" : "Himalayan/Nepalese", "code": "himalayan"],
         ["name" : "Hong Kong Style Cafe", "code": "hkcafe"],
         ["name" : "Hot Dogs", "code": "hotdog"],
         ["name" : "Hot Pot", "code": "hotpot"],
         ["name" : "Hungarian", "code": "hungarian"],
         ["name" : "Iberian", "code": "iberian"],
         ["name" : "Indian", "code": "indpak"],
         ["name" : "Indonesian", "code": "indonesian"],
         ["name" : "International", "code": "international"],
         ["name" : "Irish", "code": "irish"],
         ["name" : "Island Pub", "code": "island_pub"],
         ["name" : "Israeli", "code": "israeli"],
         ["name" : "Italian", "code": "italian"],
         ["name" : "Japanese", "code": "japanese"],
         ["name" : "Jewish", "code": "jewish"],
         ["name" : "Kebab", "code": "kebab"],
         ["name" : "Korean", "code": "korean"],
         ["name" : "Kosher", "code": "kosher"],
         ["name" : "Kurdish", "code": "kurdish"],
         ["name" : "Laos", "code": "laos"],
         ["name" : "Laotian", "code": "laotian"],
         ["name" : "Latin American", "code": "latin"],
         ["name" : "Live/Raw Food", "code": "raw_food"],
         ["name" : "Lyonnais", "code": "lyonnais"],
         ["name" : "Malaysian", "code": "malaysian"],
         ["name" : "Meatballs", "code": "meatballs"],
         ["name" : "Mediterranean", "code": "mediterranean"],
         ["name" : "Mexican", "code": "mexican"],
         ["name" : "Middle Eastern", "code": "mideastern"],
         ["name" : "Milk Bars", "code": "milkbars"],
         ["name" : "Modern Australian", "code": "modern_australian"],
         ["name" : "Modern European", "code": "modern_european"],
         ["name" : "Mongolian", "code": "mongolian"],
         ["name" : "Moroccan", "code": "moroccan"],
         ["name" : "New Zealand", "code": "newzealand"],
         ["name" : "Night Food", "code": "nightfood"],
         ["name" : "Norcinerie", "code": "norcinerie"],
         ["name" : "Open Sandwiches", "code": "opensandwiches"],
         ["name" : "Oriental", "code": "oriental"],
         ["name" : "Pakistani", "code": "pakistani"],
         ["name" : "Parent Cafes", "code": "eltern_cafes"],
         ["name" : "Parma", "code": "parma"],
         ["name" : "Persian/Iranian", "code": "persian"],
         ["name" : "Peruvian", "code": "peruvian"],
         ["name" : "Pita", "code": "pita"],
         ["name" : "Pizza", "code": "pizza"],
         ["name" : "Polish", "code": "polish"],
         ["name" : "Portuguese", "code": "portuguese"],
         ["name" : "Potatoes", "code": "potatoes"],
         ["name" : "Poutineries", "code": "poutineries"],
         ["name" : "Pub Food", "code": "pubfood"],
         ["name" : "Rice", "code": "riceshop"],
         ["name" : "Romanian", "code": "romanian"],
         ["name" : "Rotisserie Chicken", "code": "rotisserie_chicken"],
         ["name" : "Rumanian", "code": "rumanian"],
         ["name" : "Russian", "code": "russian"],
         ["name" : "Salad", "code": "salad"],
         ["name" : "Sandwiches", "code": "sandwiches"],
         ["name" : "Scandinavian", "code": "scandinavian"],
         ["name" : "Scottish", "code": "scottish"],
         ["name" : "Seafood", "code": "seafood"],
         ["name" : "Serbo Croatian", "code": "serbocroatian"],
         ["name" : "Signature Cuisine", "code": "signature_cuisine"],
         ["name" : "Singaporean", "code": "singaporean"],
         ["name" : "Slovakian", "code": "slovakian"],
         ["name" : "Soul Food", "code": "soulfood"],
         ["name" : "Soup", "code": "soup"],
         ["name" : "Southern", "code": "southern"],
         ["name" : "Spanish", "code": "spanish"],
         ["name" : "Steakhouses", "code": "steak"],
         ["name" : "Sushi Bars", "code": "sushi"],
         ["name" : "Swabian", "code": "swabian"],
         ["name" : "Swedish", "code": "swedish"],
         ["name" : "Swiss Food", "code": "swissfood"],
         ["name" : "Tabernas", "code": "tabernas"],
         ["name" : "Taiwanese", "code": "taiwanese"],
         ["name" : "Tapas Bars", "code": "tapas"],
         ["name" : "Tapas/Small Plates", "code": "tapasmallplates"],
         ["name" : "Tex-Mex", "code": "tex-mex"],
         ["name" : "Thai", "code": "thai"],
         ["name" : "Traditional Norwegian", "code": "norwegian"],
         ["name" : "Traditional Swedish", "code": "traditional_swedish"],
         ["name" : "Trattorie", "code": "trattorie"],
         ["name" : "Turkish", "code": "turkish"],
         ["name" : "Ukrainian", "code": "ukrainian"],
         ["name" : "Uzbek", "code": "uzbek"],
         ["name" : "Vegan", "code": "vegan"],
         ["name" : "Vegetarian", "code": "vegetarian"],
         ["name" : "Venison", "code": "venison"],
         ["name" : "Vietnamese", "code": "vietnamese"],
         ["name" : "Wok", "code": "wok"],
         ["name" : "Wraps", "code": "wraps"],
         ["name" : "Yugoslav", "code": "yugoslav"]]
    var sortByCollapsed:Bool = false
    var distanceCollapsed:Bool = false
    var categoryState:[Bool] = []
    var dealState:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 44
        categoryState = Array<Bool>(repeating: false, count: categories.count)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for index in 0..<categories.count {
            if let code = categories[index]["code"] {
                if (YelpSearchSettings.sharedInstance.categories.contains(code)){
                    categoryState[index] = true
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onTapCancelButton(sender: UIBarButtonItem){
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTapSearchButton(sender: UIBarButtonItem){
        let settings = YelpSearchSettings.sharedInstance
        YelpSearchSettings.sharedInstance.categories = getSelectedCategories()
        delegate?.updateSettings?(self)
        self.dismiss(animated: true, completion: nil)
    }
    
    func getSelectedCategories() -> [String] {
        var selectedCategories:[String] = []
        for index in 0..<categories.count {
            if categoryState[index] == true {
                if let code = categories[index]["code"] {
                    selectedCategories.append(code)
                }
                
            }
        }
        return selectedCategories
    }
}

extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellType = filterCellType.init(rawValue: section)!
        switch cellType {
        case .deal: return 1
        case .distance: return 0
        case .sort: return 0
        case .category: return categories.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let cellType = filterCellType.init(rawValue: section)!
        switch cellType {
            case .deal: return ""
            case .distance: return "Distance"
            case .sort: return "Sort by"
            case .category: return "Category"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        let cellType = filterCellType.init(rawValue: section)!

        switch cellType {
            case .deal:
                let cell = tableView.dequeueReusableCell(withIdentifier: "FilterSwitchTableViewCell") as! FilterSwitchTableViewCell
                cell.filterLabel.text = "Offering a deal"
                cell.filterSwitch.isOn = dealState
                cell.delegate = self
                return cell
            case .distance:
                switch distanceCollapsed {
                case true:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCollapseTableViewCell") as! FilterCollapseTableViewCell
                    cell.collapseLabel.text = "Auto"
                    return cell
                case false:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "FilterSelectTableViewCell") as! FilterSelectTableViewCell
                    return cell
            }
            case .sort:
                switch sortByCollapsed {
                case true:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCollapseTableViewCell") as! FilterCollapseTableViewCell
                    cell.collapseLabel.text = "Best match"
                    return cell
                case false:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "FilterSelectTableViewCell") as! FilterSelectTableViewCell
                    return cell
            }
            case .category:
                let cell = tableView.dequeueReusableCell(withIdentifier: "FilterSwitchTableViewCell") as! FilterSwitchTableViewCell
                if let name = categories[row]["name"] {
                    cell.filterLabel.text = name
                }
                cell.filterSwitch.isOn = categoryState[row]
                cell.delegate = self
                return cell
        }        
    }
}

extension FilterViewController: FilterSwitchTableViewCellDelegate {
    func switchDidChange(_ filterSwitchTableViewCell: FilterSwitchTableViewCell) {
        guard let indexPath = tableView.indexPath(for: filterSwitchTableViewCell),
                let cellType = filterCellType.init(rawValue: indexPath.section) else {
                return
        }
        switch cellType {
            case .deal:
                dealState = !dealState
            case .category:
                let row = indexPath.row
                categoryState[row] = !categoryState[row]
            default: break
        }
    }
}

extension FilterViewController: FilterCollapseTableViewCellDelegate {
    func collapseButtonDidTap(_ filterCollapseTableViewCell: FilterCollapseTableViewCell) {
        guard let indexPath = tableView.indexPath(for: filterCollapseTableViewCell),
            let cellType = filterCellType.init(rawValue: indexPath.section) else {
                return
        }
        switch cellType {
            case .distance: break
            case .sort: break
            default: break
        }
    }
}


