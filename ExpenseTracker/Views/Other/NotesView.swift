//
//  NotesView.swift
//  ExpenseTracker
//
//  Created by Ahmed Mohamed on 14/06/2021.
//

import UIKit

final class NotesView: UIView {
    let noteLabel = UILabel()
    let noteTextView = UITextView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        setupNoteLabel()
        setupNoteTextView()
    }

    private func setupNoteLabel() {
        noteLabel.translatesAutoresizingMaskIntoConstraints = false
        noteLabel.text = "Add note"
        noteLabel.textColor = .label
        noteLabel.font = .systemFont(ofSize: 15)

        addSubview(noteLabel)
        noteLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        noteLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    }

    private func setupNoteTextView() {
        noteTextView.translatesAutoresizingMaskIntoConstraints = false
        noteTextView.center = self.center
        noteTextView.textAlignment = .justified
        noteTextView.textContentType = .jobTitle
//        noteTextView.backgroundColor = .red

        addSubview(noteTextView)
        noteTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 130).isActive = true
        noteTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 70).isActive = true
        noteTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -70).isActive = true
        noteTextView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        noteTextView.becomeFirstResponder()
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

