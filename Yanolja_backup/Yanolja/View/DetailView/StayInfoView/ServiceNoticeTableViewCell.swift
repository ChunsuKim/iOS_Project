//
//  ServiceNoticeTableViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/08/01.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ServiceNoticeTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "이용안내"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "기본규정"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        return label
    }()
    
    let cont: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        contentView.addSubview(title)
        contentView.addSubview(subTitle)
        contentView.addSubview(cont)
        configureConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure Constraint
    private func configureConstraint() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            title.bottomAnchor.constraint(equalTo: subTitle.topAnchor, constant: -20),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -20),
            subTitle.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            subTitle.trailingAnchor.constraint(equalTo: title.trailingAnchor),
            cont.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 10),
            cont.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cont.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cont.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }

}
