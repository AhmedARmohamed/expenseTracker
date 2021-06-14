//
//  ProfileView.swift
//  ExpenseTracker
//
//  Created by Ahmed Mohamed on 14/06/2021.
//

import UIKit

final class ProfileView: UIView {
    
    var headerTitle = UILabel()
    var searchBarButton = UIButton()
    var bankName = UILabel()
    var amountLabel = UILabel()
    var bankView = UIView()
    var bankButton = UIButton()
    let templateColor = UIColor.white
    var emailHeader = UILabel()
    var emailLabell = UILabel()
    var dateOfBirthHeader = UILabel()
    var dateOfBirthLabel = UILabel()
    var passwordHeader = UILabel()
    var passwordLabel = UILabel()
   
    
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "active user")
        return iv
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Abbie Wilson"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "abbie.Wilson@gmail.com"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupProfileImageandText()
        setupBankView()
        setupBankName()
        setupAmountLabel()
        setupUpdateButton()
        setupEmail()
        setupDateOfBirth()
    }
    
    private func setupProfileImageandText() {
        let profileImageDimension: CGFloat = 60
        
        addSubview(profileImageView)
        profileImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
//        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: profileImageDimension).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: profileImageDimension).isActive = true
        profileImageView.layer.cornerRadius = profileImageDimension / 2
        
        addSubview(usernameLabel)
        usernameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
//        usernameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: -10).isActive = true
        usernameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 12).isActive = true
        
        addSubview(emailLabel)
        emailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10).isActive = true
//        emailLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: 10).isActive = true
        emailLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 12).isActive = true
    }
    
    private func setupBankView() {
        bankView.translatesAutoresizingMaskIntoConstraints = false
        bankView.layer.borderColor = UIColor.white.cgColor
        bankView.layer.borderWidth = 1.0
        bankView.backgroundColor = UIColor(red: 235/255, green: 73/255, blue: 121/255, alpha: 1)
        bankView.layer.cornerRadius = 24.0
        bankView.layer.shadowColor = UIColor.gray.cgColor
        bankView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        bankView.layer.shadowRadius = 12.0
        bankView.layer.shadowOpacity = 0.7
        bankView.isUserInteractionEnabled = true
        
        addSubview(bankView)
        bankView.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 50).isActive = true
        bankView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        bankView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        bankView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        bankView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private func setupBankName() {
        bankName.translatesAutoresizingMaskIntoConstraints = false
        bankName.text = "United Bank of Asia"
        bankName.font = .boldSystemFont(ofSize: 13)
        bankName.textColor = .white
        
        bankView.addSubview(bankName)
        bankName.topAnchor.constraint(equalTo: bankView.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        bankName.leadingAnchor.constraint(equalTo: bankView.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
    }
    
    private func setupAmountLabel() {
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.text = "United Bank of Asia"
        amountLabel.font = .boldSystemFont(ofSize: 15)
        amountLabel.textColor = .white
        
        bankView.addSubview(amountLabel)
        amountLabel.topAnchor.constraint(equalTo: bankName.bottomAnchor, constant: 20).isActive = true
        amountLabel.leadingAnchor.constraint(equalTo: bankView.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
    }
    
    private func setupUpdateButton() {
        bankButton.translatesAutoresizingMaskIntoConstraints = false
        bankButton.layer.cornerRadius = 13
        bankButton.isEnabled = true
        bankButton.layer.borderWidth = 1
        bankButton.tintColor = UIColor(red: 187/255, green: 58/255, blue: 96/255, alpha: 1)
        bankButton.layer.borderColor = UIColor.white.cgColor

        bankView.addSubview(bankButton)
        bankButton.topAnchor.constraint(equalTo: bankView.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        bankButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        bankButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        bankButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        let buttonAttributesDictionary = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0), NSAttributedString.Key.foregroundColor: templateColor]
        bankButton.setAttributedTitle(NSAttributedString(string: "Update", attributes: buttonAttributesDictionary), for: .normal)
    }
    
    private func setupEmail() {
        // set up email label
        emailHeader.translatesAutoresizingMaskIntoConstraints = false
        emailHeader.text = "Email"
        emailHeader.font = .systemFont(ofSize: 17)
        emailHeader.textColor = .label
        
        addSubview(emailHeader)
        emailHeader.topAnchor.constraint(equalTo: bankView.bottomAnchor, constant: 50).isActive = true
        emailHeader.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        emailHeader.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        // set up email textField
        emailLabell.translatesAutoresizingMaskIntoConstraints = false
        emailLabell.text = "abbi.wilson@gmail.com"
        emailLabell.font = .boldSystemFont(ofSize: 20)
        emailLabell.textColor = .label

        addSubview(emailLabell)
        emailLabell.topAnchor.constraint(equalTo: emailHeader.bottomAnchor, constant: 10).isActive = true
        emailLabell.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        emailLabell.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
    }
    
    private func setupDateOfBirth() {
        // set up email label
        dateOfBirthHeader.translatesAutoresizingMaskIntoConstraints = false
        dateOfBirthHeader.text = "Date of Birth"
        dateOfBirthHeader.font = .systemFont(ofSize: 17)
        dateOfBirthHeader.textColor = .label
        
        addSubview(dateOfBirthHeader)
        dateOfBirthHeader.topAnchor.constraint(equalTo: emailLabell.bottomAnchor, constant: 30).isActive = true
        dateOfBirthHeader.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        dateOfBirthHeader.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        // set up email textField
        dateOfBirthLabel.translatesAutoresizingMaskIntoConstraints = false
        dateOfBirthLabel.text = "04-19-1992"
        dateOfBirthLabel.font = .boldSystemFont(ofSize: 20)
        dateOfBirthLabel.textColor = .label

        addSubview(dateOfBirthLabel)
        dateOfBirthLabel.topAnchor.constraint(equalTo: dateOfBirthHeader.bottomAnchor, constant: 10).isActive = true
        dateOfBirthLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        dateOfBirthLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
//    private func setupPassword() {
//        // set up email label
//        passwordHeader.translatesAutoresizingMaskIntoConstraints = false
//        passwordHeader.text = "Password"
//        passwordHeader.font = .systemFont(ofSize: 17)
//        passwordHeader.textColor = .label
//
//        addSubview(passwordHeader)
//        passwordHeader.topAnchor.constraint(equalTo: dateOfBirthLabel.bottomAnchor, constant: 30).isActive = true
//        passwordHeader.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
//        passwordHeader.trailingAnchor.constraint(equalTo: headerTitle.trailingAnchor, constant: 0).isActive = true
//
//        // set up email textField
//        // Todo: Hide the text characters
//        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
//        passwordLabel.text = "123456"
//        passwordLabel.font = .boldSystemFont(ofSize: 20)
//        passwordLabel.textColor = .label
////        passwordLabel.text.ihid
//
//        addSubview(passwordLabel)
//        passwordLabel.topAnchor.constraint(equalTo: passwordHeader.bottomAnchor, constant: 10).isActive = true
//        passwordLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
//        passwordLabel.trailingAnchor.constraint(equalTo: headerTitle.trailingAnchor, constant: 0).isActive = true
//    }
}

