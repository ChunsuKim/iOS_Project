//
//  DefaultCell.swift
//  Yanolja
//
//  Created by brian은석 on 19/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class DefaultCell: UITableViewCell {
    let label = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        
    }
    func configure() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        label.textAlignment = .center
        label.text = "최근 검색한 내용이 없습니다."
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
