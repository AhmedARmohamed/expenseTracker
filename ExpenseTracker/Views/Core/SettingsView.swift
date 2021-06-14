//
//  SettingsView.swift
//  ExpenseTracker
//
//  Created by Ahmed Mohamed on 14/06/2021.
//

import UIKit

final class SettingsView: UIView {
    
    var goProLabel = UILabel()
    var getPremiumLabel = UILabel()
    var PremiumView = UIView()
    var tableView = UITableView()
    var scrollView = UIScrollView()
    
    // Mark: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupScrollView()
        setupPremiumView()
        setupgetPremiumNowLabel()
        setupgoProLabel()
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
    
    private func setupPremiumView() {
        PremiumView.translatesAutoresizingMaskIntoConstraints = false
        PremiumView.layer.borderColor = UIColor.white.cgColor
        PremiumView.layer.borderWidth = 1.0
        PremiumView.backgroundColor = UIColor(red: 235/255, green: 73/255, blue: 121/255, alpha: 1)
        PremiumView.layer.cornerRadius = 24.0
        PremiumView.layer.shadowColor = UIColor.gray.cgColor
        PremiumView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        PremiumView.layer.shadowRadius = 12.0
        PremiumView.layer.shadowOpacity = 0.7
        PremiumView.isUserInteractionEnabled = true
        
        scrollView.addSubview(PremiumView)
        PremiumView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        PremiumView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        PremiumView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        PremiumView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        PremiumView.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func setupgetPremiumNowLabel() {
        getPremiumLabel.translatesAutoresizingMaskIntoConstraints = false
        getPremiumLabel.text = "Get Premium Now"
        getPremiumLabel.font = .boldSystemFont(ofSize: 15)
        getPremiumLabel.textColor = .white
        
        PremiumView.addSubview(getPremiumLabel)
        getPremiumLabel.topAnchor.constraint(equalTo: PremiumView.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        getPremiumLabel.leadingAnchor.constraint(equalTo: PremiumView.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        
        
    }
    
    private func setupgoProLabel() {
        goProLabel.translatesAutoresizingMaskIntoConstraints = false
        goProLabel.text = "Upgrade now to unlock more unique features"
        goProLabel.font = .boldSystemFont(ofSize: 13)
        goProLabel.textColor = .white
        
        PremiumView.addSubview(goProLabel)
        goProLabel.topAnchor.constraint(equalTo: getPremiumLabel.bottomAnchor, constant: 20).isActive = true
        goProLabel.leadingAnchor.constraint(equalTo: PremiumView.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: PremiumView.bottomAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
}


