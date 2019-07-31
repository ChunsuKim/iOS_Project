//
//  StayRoomInfoTableViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/31.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class StayRoomInfoTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    let cellTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        contentView.addSubview(cellTitle)
        configureConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure Constraints
    private func configureConstraint() {
        NSLayoutConstraint.activate([
            cellTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            cellTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            cellTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -20),
        ])
    }
    
}
