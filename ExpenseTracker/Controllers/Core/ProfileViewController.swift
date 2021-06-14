//
//  ProfileViewController.swift
//  ExpenseTracker
//
//  Created by Ahmed Mohamed on 14/06/2021.
//

import UIKit

class ProfileViewController: UIViewController {

    var settingsButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
        view.backgroundColor = .systemBackground
    }
    

    override func loadView() {
        let vieww = ProfileView()
        view = vieww
    }
    
    
    func setupNavigation() {
        navigationItem.title = "Profile"
        let button = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettingButton))
        self.navigationItem.rightBarButtonItem = button
        
    }
    
    @objc private func didTapSettingButton() {
        let settingsViewController = SettingsViewController()
        navigationController?.pushViewController(settingsViewController, animated: true)
    }

}
