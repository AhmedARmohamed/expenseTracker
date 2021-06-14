//
//  PaymentViewController.swift
//  ExpenseTracker
//
//  Created by Ahmed Mohamed on 14/06/2021.
//

import UIKit

class PaymentViewController: UIViewController {
    
    var tableview = UITableView()

    let category = ["Cash", "Debit Card", "Credit card", "Bank transfer", "Voucher", "Mobile payment"]
    let cellId = "cellId"

    var selectedAccount: String!
//    weak var delegate: AddVC!

//    var myProtocol: passDataBack?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
        configureTableView()
        view.backgroundColor = .systemBackground
    }
    

    func setupNavigation() {
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = "Accounts"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleDone))
    }

    override func loadView() {
        let account = PaymentView()
        view = account

        tableview = account.tableView
    }

    @objc private func handleDone() {
        print("Done...")
    }

    @objc private func handleCancel() {
        print("Cancell...")
        self.dismiss(animated: true, completion: nil)
    }

    func configureTableView() {
        setTableViewDelegates()
        tableview.rowHeight = 60
        tableview.allowsMultipleSelection = false
        tableview.separatorStyle = .singleLine
        tableview.tableFooterView = UIView()

    }

    func setTableViewDelegates() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(PaymentTableViewCell.self, forCellReuseIdentifier: cellId)
    }

}

extension PaymentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PaymentTableViewCell
        cell.accountType.text = category[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedAccount = category[indexPath.row]
//        myProtocol?.passMyDataBack(data: selectedAccount!)
//        print(selectedAccount!)
        self.navigationController?.popToRootViewController(animated: true)
    }
}

