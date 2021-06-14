//
//  ViewController.swift
//  ExpenseTracker
//
//  Created by Ahmed Mohamed on 14/06/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    var tableview = UITableView()
    let cellId = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddExpense))
    }

    override func loadView() {
        let homeView = HomeView()
        view = homeView
        
        tableview = homeView.tableView
    }
    
    
    @objc private func handleAddExpense() {
        let addVC = AddExpenseViewController()
        addVC.modalPresentationStyle = .overFullScreen
        present(UINavigationController(rootViewController: addVC), animated: false)
    }


}

