//
//  PaymentTableViewCell.swift
//  ExpenseTracker
//
//  Created by Ahmed Mohamed on 14/06/2021.
//

import UIKit

final class PaymentTableViewCell: UITableViewCell {

    var accountType = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        selectionStyle = .none
        accessoryType = selected ? .checkmark : .none
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        setuAccountTypeLabel()
    }

    private func setuAccountTypeLabel() {
        accountType.translatesAutoresizingMaskIntoConstraints = false
        accountType.textColor = .label

        addSubview(accountType)
        accountType.topAnchor.constraint(equalTo: topAnchor).isActive = true
        accountType.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
    }

}

