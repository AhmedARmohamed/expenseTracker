//
//  AddExpenseView.swift
//  ExpenseTracker
//
//  Created by Ahmed Mohamed on 14/06/2021.
//

import UIKit

final class AddExpenseView: UIView {
    
    let items = ["Income", "Expense"]
    lazy var segmentedControl = UISegmentedControl(items: items)
    let currencyLabel = UILabel()
    let amountLabel = UITextField()
    let cellId = "cellId"
    let createButton = UIButton()
    let generalLabel = UILabel()
    let templateColor = UIColor.label
    var scrollView = UIScrollView()
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        return table
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        setupScrollView()
        setupTableView()
        setupSaveButton()
    }
    
    private func setupScrollView() {
        
        let layout = safeAreaLayoutGuide
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: self.frame.size.width, height: 1000)
        
        addSubview(scrollView)
        scrollView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: layout.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: layout.heightAnchor).isActive = true
    }

    private func setupTableView() {
        scrollView.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor, constant: 0.0).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0.0).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0.0).isActive = true
//        tableView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupSaveButton() {
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.layer.cornerRadius = 13
        createButton.isEnabled =  true
        createButton.backgroundColor = .systemBlue
        addSubview(createButton)
        createButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        createButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        createButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        createButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        let buttonAttributesDictionary = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0), NSAttributedString.Key.foregroundColor: templateColor]
        createButton.setAttributedTitle(NSAttributedString(string: "Save", attributes: buttonAttributesDictionary), for: .normal)
    }

    //hide Keyboard when uses touches outside Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }

    // hide keyboard when uses presses return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
