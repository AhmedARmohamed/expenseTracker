//
//  CategoryViewController.swift
//  ExpenseTracker
//
//  Created by Ahmed Mohamed on 14/06/2021.
//

import UIKit

struct Category {
    let title: String
}

class CategoryViewController: UIViewController {
    
    var tableview = UITableView()
    let cellId = "cellId"

//    var myCategory: passcategoryBack!
    var selectedCategory: String!
    
    var models = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Categories"
        navigationController?.navigationBar.prefersLargeTitles = true
        configure()
        configureTableView()
        view.backgroundColor = .systemBackground
    }
    

    override func loadView() {
        let viewObject = CategoryView()
        view = viewObject

        tableview = viewObject.tableView
    }
    
    func configureTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.rowHeight = 50
        tableview.tableFooterView = UIView()
        tableview.register(CategoriesTableViewCell.self, forCellReuseIdentifier: cellId)
    }

    @objc private func handleCancel() {
        print("Cancel...")
        self.dismiss(animated: true, completion: nil)
    }
    
    func configure() {
        models.append(Section(title: "All Categories", options: [
            SettingOption(title: "Food & Drinks", icon: #imageLiteral(resourceName: "baseline_restaurant_black_24pt_1x"), iconBackgroundColor: .systemRed) {
                
            },
            
            SettingOption(title: "Shopping", icon: #imageLiteral(resourceName: "baseline_restaurant_black_24pt_1x"), iconBackgroundColor: .systemBlue) {
                
            },
            
            SettingOption(title: "Housing", icon: #imageLiteral(resourceName: "baseline_restaurant_black_24pt_1x"), iconBackgroundColor: .systemPink) {
                
            },
            
            SettingOption(title: "Transportation", icon: #imageLiteral(resourceName: "baseline_restaurant_black_24pt_1x"), iconBackgroundColor: .systemTeal) {
                
            },
            
            SettingOption(title: "Vehicle", icon: #imageLiteral(resourceName: "baseline_restaurant_black_24pt_1x"), iconBackgroundColor: .systemGreen) {
                
            },
            
            
            SettingOption(title: "Life & Entertainment", icon: #imageLiteral(resourceName: "baseline_restaurant_black_24pt_1x"), iconBackgroundColor: .systemGray) {
                
            },

            SettingOption(title: "Communication & PC", icon: #imageLiteral(resourceName: "baseline_restaurant_black_24pt_1x"), iconBackgroundColor: .systemOrange) {
                
            },

            
            
            SettingOption(title: "Financial expenses", icon: #imageLiteral(resourceName: "baseline_restaurant_black_24pt_1x"), iconBackgroundColor: .systemYellow) {
                
            },
            
            SettingOption(title: "Investments", icon: #imageLiteral(resourceName: "baseline_restaurant_black_24pt_1x"), iconBackgroundColor: .systemIndigo) {
                
            },
            
            SettingOption(title: "Income", icon: #imageLiteral(resourceName: "baseline_restaurant_black_24pt_1x"), iconBackgroundColor: .systemRed) {
                
            },
            
            SettingOption(title: "Other", icon: #imageLiteral(resourceName: "baseline_restaurant_black_24pt_1x"), iconBackgroundColor: .systemBlue) {
                
            },
       
        ]))
    }

}
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = tableview.dequeueReusableCell(withIdentifier: cellId, for: indexPath)as? CategoriesTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: model)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.navigationController?.popToRootViewController(animated: true)
        tableview.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        model.handler()
    }

}


