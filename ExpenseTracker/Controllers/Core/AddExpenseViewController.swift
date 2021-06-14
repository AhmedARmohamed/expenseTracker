//
//  AddExpenseViewController.swift
//  ExpenseTracker
//
//  Created by Ahmed Mohamed on 14/06/2021.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingOption]
}

struct SettingOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class AddExpenseViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var tableview: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        return table
    }()
    let cellId = "cellId"
    var models = [Section]()
    
    var amountLabel = UITextField()
    var saveButton = UIButton()
    var scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        isModalInPresentation = true
        configure()
        configureTableView()
        setupNavigation()
    }
    

    override func loadView() {
        let addExpense = AddExpenseView()
        view = addExpense
        scrollView = addExpense.scrollView
        scrollView.delegate = self
        tableview = addExpense.tableView
        saveButton = addExpense.createButton
    }
    
    func setupNavigation() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = "New Expense"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
    }
    
    func configureTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(AddTransactionTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    @objc private func handleSave() {
        print("saveddd")
    }
    
    @objc private func handleCancel() {
        print("Cancel...")
        self.dismiss(animated: true, completion: nil)
    }
    
    //hide Keyboard when uses touches outside Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // hide keyboard when uses presses return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func configure() {
        models.append(Section(title: "General", options: [
            SettingOption(title: "Amount", icon: UIImage(systemName: "dollarsign.circle"), iconBackgroundColor: .systemGray) {
                print("Amount")
                
            },
            
            SettingOption(title: "Currency", icon: UIImage(systemName: "coloncurrencysign.circle"), iconBackgroundColor: .systemGray) {
                
            },
            
            SettingOption(title: "Category", icon: UIImage(systemName: "folder.badge.plus"), iconBackgroundColor: .systemGray) {
                let vc = CategoryViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            },
            
            SettingOption(title: "Account", icon: UIImage(systemName: "questionmark"), iconBackgroundColor: .systemGray) {
                let vc = PaymentViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            },
            
            SettingOption(title: "Date", icon: UIImage(systemName: "calendar"), iconBackgroundColor: .systemGray) {
                let vc = CalenderViewController()
                vc.view.backgroundColor = .systemBackground
                    self.navigationController?.pushViewController(vc, animated: true)
            },

            SettingOption(title: "Time", icon: UIImage(systemName: "clock"), iconBackgroundColor: .systemGray) {

            },
        ]))
        
        models.append(Section(title: "More", options: [

            SettingOption(title: "Notes", icon: UIImage(systemName: "square.and.pencil"), iconBackgroundColor: .systemGray) {
                let vc = NotesViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            },
            SettingOption(title: "Location", icon: UIImage(systemName: "location.north"), iconBackgroundColor: .systemGray) {
                let location = LocationViewController()
                self.navigationController?.pushViewController(location, animated: true)
            },

            SettingOption(title: "Take Photo", icon: UIImage(systemName: "camera"), iconBackgroundColor: .systemGray) {
                let vc = UIImagePickerController()
                vc.sourceType = .camera
                vc.allowsEditing = true
                vc.delegate = self
                self.present(vc, animated: true)
            },

    SettingOption(title: "Scan Receipt", icon: UIImage(systemName: "doc.text.viewfinder"), iconBackgroundColor: .systemGray) {
        let vc = ScannerViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    },
        ]))
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }

        // print out the image size as a test
        print(image.size)
    }
    

}

extension AddExpenseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = tableview.dequeueReusableCell(withIdentifier: cellId, for: indexPath)as? AddTransactionTableViewCell else {
            return UITableViewCell()
        }
        
        if indexPath.row == 0 {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "-$ 0"
            
            cell.accessoryView = textField
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

extension String {
    public  func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
