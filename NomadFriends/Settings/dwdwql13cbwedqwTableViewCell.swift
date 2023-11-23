//
//  SettingsTableViewCell.swift
//  NomadFriends
//
//  Created by Ravil on 22.11.2023.
//

import UIKit

class dwdwql13cbwedqwTableViewCell: UITableViewCell {

    var titleCellSettings = UILabel()
    
    static let reuseID = String(describing: dwdwql13cbwedqwTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSettingsViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension dwdwql13cbwedqwTableViewCell {
    private func setupSettingsViews() {
        titleCellSettings.text = "aldDLda"
        titleCellSettings.textColor = .white
        titleCellSettings.numberOfLines = 0
        titleCellSettings.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        titleCellSettings.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleCellSettings)
        
        NSLayoutConstraint.activate([
            titleCellSettings.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleCellSettings.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleCellSettings.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleCellSettings.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
