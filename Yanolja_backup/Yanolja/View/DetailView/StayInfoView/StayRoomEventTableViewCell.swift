//
//  StayRoomEventTableViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/31.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class StayRoomEventTableViewCell: UITableViewCell {
    
    let spotEvent: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("현장 이벤트", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.4470588235, blue: 0.6980392157, alpha: 1), for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0, green: 0.4470588235, blue: 0.6980392157, alpha: 1)
        
        return button
    }()
    
    let commentEvent: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("댓글 이벤트", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.4470588235, blue: 0.6980392157, alpha: 1), for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0, green: 0.4470588235, blue: 0.6980392157, alpha: 1)
        
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        contentView.addSubview(spotEvent)
        contentView.addSubview(commentEvent)
        configureConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure constraints
    private func configureConstraint() {
        NSLayoutConstraint.activate([
            spotEvent.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            spotEvent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            spotEvent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            spotEvent.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5, constant: -25),
            spotEvent.trailingAnchor.constraint(equalTo: commentEvent.leadingAnchor, constant: -10),
            commentEvent.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            commentEvent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            commentEvent.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5, constant: -25),
            commentEvent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }

}
