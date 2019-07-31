//
//  IntroduceStayTableViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/31.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class IntroduceStayTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    var buttonAction: (() -> ())?
    
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "숙소 소개"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        return label
    }()
    
    let cont: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        
        return label
    }()
    
    let moreButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("더보기", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.4470588235, blue: 0.6980392157, alpha: 1), for: .normal)
        button.setTitleColor(.white, for: .selected)
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        contentView.addSubview(title)
        contentView.addSubview(cont)
        contentView.addSubview(moreButton)
        configureConstraints()
        
        moreButton.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure Constraints
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cont.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            cont.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cont.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cont.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
    
    // MARK: - Action Method
    @objc func buttonDidTap(_ sender: Any) {
        buttonAction?()
    }
}
