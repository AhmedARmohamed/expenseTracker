//
//  NotesViewController.swift
//  ExpenseTracker
//
//  Created by Ahmed Mohamed on 14/06/2021.
//

import UIKit

class NotesViewController: UIViewController {

    var textView = UITextView()

    var notes: String!

//    var myNotesProtocol: passNotesBack!

    override func viewDidLoad() {
        super.viewDidLoad()

        let toolBar = UIToolbar()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(passNotestoControler))
        toolBar.setItems([doneButton], animated: true)
        toolBar.sizeToFit()
        textView.inputAccessoryView = toolBar

        setupNavigation()
        view.backgroundColor = .systemBackground

        
    }
    
    func setupNavigation() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = "Description"

    }

    override func loadView() {
        let descriptionView = NotesView()
        view = descriptionView

        textView = descriptionView.noteTextView
    }

    @objc private func handleDone() {
        guard let notes = textView.text, textView.hasText else {
            print("Handle errors...")
            return
        }

//        myNotesProtocol?.passMyNotesBack(notes: notes)
        print(notes)
        self.dismiss(animated: true, completion: nil)
    }

    @objc private func handleCancel() {
        print("Cancel...")
        self.navigationController?.popToRootViewController(animated: true)
    }

    @objc private func passNotestoControler() {
        guard let notes = textView.text, textView.hasText else {
            print("Handle errors...")
            return
        }

//        myNotesProtocol?.passMyNotesBack(notes: notes)
        print(notes)
        self.navigationController?.popToRootViewController(animated: true)
    }
    

 

}

