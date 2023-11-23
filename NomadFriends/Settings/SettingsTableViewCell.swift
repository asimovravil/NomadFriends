//
//  SettingsTableViewCell.swift
//  NomadFriends
//
//  Created by Ravil on 22.11.2023.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    var titleCell = UILabel()
    
    static let reuseID = String(describing: SettingsTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSettingsViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingsTableViewCell {
    private func setupSettingsViews() {
        titleCell.text = "aldDLda"
        titleCell.textColor = .white
        titleCell.numberOfLines = 0
        titleCell.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        titleCell.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleCell)
        
        NSLayoutConstraint.activate([
            titleCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
