//
//  HomeView.swift
//  ExpenseTracker
//
//  Created by Ahmed Mohamed on 14/06/2021.
//

import UIKit

final class HomeView: UIView {
    
    var tableView = UITableView()
    var totalLabel = UILabel()
    var headerView = UIView()
    var contentView = UIView()
    var transactionHistoryLabel = UILabel()
    var transactionMonthLabel = UILabel()
    var transactionDay = UILabel()
    var scrollView = UIScrollView()
    
    var totalBalanceLabel = UILabel()
    var amountLabel = UILabel()
    var incomeLabel = UILabel()
    var incomeAmountLabel = UILabel()
    var expenseLabel = UILabel()
    var expenseAmountLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupScrollView()
        setupHeaderView()
        setupTotalBalanceLabels()
        setupIncomeLabels()
        setupExpenseLabels()
        setupTransactionHistoryLabel()
        setupTableView()
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
    
    private func setupHeaderView() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.layer.borderColor = UIColor.white.cgColor
        headerView.layer.borderWidth = 0
        headerView.backgroundColor = .systemBlue
        headerView.layer.cornerRadius = 24.0
        //        headerView.layer.shadowRadius = 12.0
        //        headerView.layer.shadowOpacity = 0.3
        headerView.isUserInteractionEnabled = true
        
        scrollView.addSubview(headerView)
        headerView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        headerView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        headerView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
    private func setupTotalBalanceLabels() {
        totalBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        totalBalanceLabel.text = "Total Balance"
        totalBalanceLabel.textColor = .label
        totalBalanceLabel.font = .systemFont(ofSize: 15)
        
        headerView.addSubview(totalBalanceLabel)
        totalBalanceLabel.topAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        totalBalanceLabel.centerXAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.text = "$ 4800.00"
        amountLabel.textColor = .label
        amountLabel.font = .boldSystemFont(ofSize: 26)
        
        headerView.addSubview(amountLabel)
        amountLabel.topAnchor.constraint(equalTo: totalBalanceLabel.bottomAnchor, constant: 20).isActive = true
        amountLabel.centerXAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        
    }
    
    private func setupIncomeLabels() {
        incomeLabel.translatesAutoresizingMaskIntoConstraints = false
        incomeLabel.text = "Income"
        incomeLabel.textColor = .label
        incomeLabel.font = .systemFont(ofSize: 12)
        
        headerView.addSubview(incomeLabel)
        incomeLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 20).isActive = true
        incomeLabel.leadingAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        incomeAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        incomeAmountLabel.text = "$ 2,500.000"
        incomeAmountLabel.textColor = .label
        incomeAmountLabel.font = .systemFont(ofSize: 15)
        
        headerView.addSubview(incomeAmountLabel)
        incomeAmountLabel.topAnchor.constraint(equalTo: incomeLabel.bottomAnchor, constant: 10).isActive = true
        incomeAmountLabel.leadingAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
    }
    
    private func setupExpenseLabels() {
        expenseLabel.translatesAutoresizingMaskIntoConstraints = false
        expenseLabel.text = "Expense"
        expenseLabel.textColor = .label
        expenseLabel.font = .systemFont(ofSize: 12)
        
        headerView.addSubview(expenseLabel)
        expenseLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 20).isActive = true
        expenseLabel.trailingAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        expenseAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        expenseAmountLabel.text = "$ 500.000"
        expenseAmountLabel.textColor = .label
        expenseAmountLabel.font = .systemFont(ofSize: 15)
        
        headerView.addSubview(expenseAmountLabel)
        expenseAmountLabel.topAnchor.constraint(equalTo: expenseLabel.bottomAnchor, constant: 10).isActive = true
        expenseAmountLabel.trailingAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    
    
    
    private func setupTransactionHistoryLabel(){
        transactionHistoryLabel.text = "Transaction"
        transactionHistoryLabel.font = .boldSystemFont(ofSize: 18)
        transactionHistoryLabel.textColor = .label
        transactionHistoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(transactionHistoryLabel)
        transactionHistoryLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30).isActive = true
        transactionHistoryLabel.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
    }
    
    
    private func setupTableView() {
        
        scrollView.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: transactionHistoryLabel.bottomAnchor, constant: 10.0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 30.0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -30.0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
}

