//
//  SettingsViewController.swift
//  ExpenseTracker
//
//  Created by Ahmed Mohamed on 14/06/2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var tableview: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        return table
    }()
    let cellId = "cell"
    
    let twoDimensionalArray = [
        ["Notification", "Category"],
        ["Themes", "App Icon"],
        ["Face ID"],
        ["Currency", "Converter"],
        ["Export", "iCloud Sync"],
        ["Support","Rate this App","Recommend to a Friend"],
        ["Subscriptions", "Permissions","Privacy Policy", "Terms of Use", "About Financial Tracker"]
    ]
    let cellSpacingHeight: CGFloat = 40
    //Array that store index of opened Section while running
      var collapaseHandlerArray = [String]()
    
    var models = [Section]()
    
    var scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configure()
        configureTableView()
    }
    

    override func loadView() {
     let settingsView = SettingsView()
        view = settingsView
        scrollView = settingsView.scrollView
        scrollView.delegate = self
        tableview = settingsView.tableView
    }

    func configureTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(SettingsTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    func configure() {
        models.append(Section(title: "General", options: [
            SettingOption(title: "Categories", icon: UIImage(systemName: "folder.badge.plus"), iconBackgroundColor: .systemGray) {
                print("fkjaljfa")
                
            },
            
            SettingOption(title: "Recurring Transactions", icon: UIImage(systemName: "dollarsign.circle"), iconBackgroundColor: .systemGray) {
                
            },
            
            SettingOption(title: "Notifications", icon: UIImage(systemName: "bell"), iconBackgroundColor: .systemGray) {
                
            },
        ]))
        
        models.append(Section(title: "Appearance", options: [
            SettingOption(title: "Themes", icon: UIImage(systemName: "paintbrush.fill"), iconBackgroundColor: .systemGray) {
                
            },
            
            SettingOption(title: "App Icon", icon: UIImage(systemName: "dollarsign.square.fill"), iconBackgroundColor: .systemGray) {
                
            },
        ]))
        
        models.append(Section(title: "Security", options: [
            SettingOption(title: "FaceID", icon: UIImage(systemName: "faceid"), iconBackgroundColor: .systemGray) {
                
            },
            
            SettingOption(title: "Passcode", icon: UIImage(systemName: "lock.fill"), iconBackgroundColor: .systemGray) {
                
            },
        ]))
        
        models.append(Section(title: "Currency", options: [
            SettingOption(title: "Default", icon: UIImage(systemName: "flag"), iconBackgroundColor: .systemGray) {
                
            },
            
            SettingOption(title: "Converter", icon: UIImage(systemName: "arrow.triangle.2.circlepath"), iconBackgroundColor: .systemGray) {
                
            },
        ]))
        
        models.append(Section(title: "Data", options: [
            SettingOption(title: "Export", icon: UIImage(systemName: "square.and.arrow.down.fill"), iconBackgroundColor: .systemGray) {
                
            },
            
            SettingOption(title: "iCloud Sync", icon: UIImage(systemName: "cloud.fill"), iconBackgroundColor: .systemGray) {
                
            },
        ]))
        
        models.append(Section(title: "Attachments", options: [
            SettingOption(title: "Save Photos to Camera Roll", icon: UIImage(systemName: "photo.on.rectangle"), iconBackgroundColor: .systemGray) {
                
            },
            
            SettingOption(title: "Save Receipts to Camera Roll", icon: UIImage(systemName: "text.below.photo.fill"), iconBackgroundColor: .systemGray) {
                
            },
            
            SettingOption(title: "Automatically preselect current location", icon: UIImage(systemName: "location.north.line"), iconBackgroundColor: .systemGray) {
                
            },
        ]))
        
        models.append(Section(title: "Social", options: [
            SettingOption(title: "Support", icon: UIImage(systemName: "plus.message"), iconBackgroundColor: .systemGray) {
                
            },
            
            SettingOption(title: "Save Receipts to Camera Roll", icon: UIImage(systemName: "text.below.photo.fill"), iconBackgroundColor: .systemGray) {
                
            },
            
            SettingOption(title: "Rate this App", icon: UIImage(systemName: "star.fill"), iconBackgroundColor: .systemGray) {
                
            },
            
            SettingOption(title: "Recommend To A Friend", icon: UIImage(systemName: "figure.stand.line.dotted.figure.stand"), iconBackgroundColor: .systemGray) {
                
            },
        ]))
        
        models.append(Section(title: "Others", options: [
            SettingOption(title: "Manage Subscriptions", icon: UIImage(systemName: "plus.rectangle.fill.on.folder.fill"), iconBackgroundColor: .systemGray) {
                
            },
            
            SettingOption(title: "Permissions", icon: UIImage(systemName: "gearshape.2"), iconBackgroundColor: .systemGray) {
                
            },
            
            SettingOption(title: "Privacy Policy", icon: UIImage(systemName: "hand.raised.fill"), iconBackgroundColor: .systemGray) {
                
            },
            
            SettingOption(title: "Terms of Use", icon: UIImage(systemName: "rectangle.and.pencil.and.ellipsis"), iconBackgroundColor: .systemGray) {
                
            },
            
            SettingOption(title: "About Financial Tracker", icon: UIImage(systemName: "creditcard.fill"), iconBackgroundColor: .systemGray) {
                
            },
        ]))

    }

}


extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = tableview.dequeueReusableCell(withIdentifier: cellId, for: indexPath)as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: model)
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        model.handler()
    }

}
