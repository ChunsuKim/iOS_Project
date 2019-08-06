//
//  RoomInfoTableViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/08/01.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class RoomInfoTableViewCell: UITableViewCell {

    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        
        return label
    }()
    
    let hotelIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = #imageLiteral(resourceName: "building")
        
        return image
    }()
    
    let hotelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    let callIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        var image = #imageLiteral(resourceName: "call").withRenderingMode(.alwaysTemplate)
        imageView.tintColor = #colorLiteral(red: 0.1411764706, green: 0.4823529412, blue: 0.6235294118, alpha: 1)
        imageView.image = image
        
        return imageView
    }()
    
    let callLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "전화하기"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.1411764706, green: 0.4823529412, blue: 0.6235294118, alpha: 1)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        contentView.addSubview(title)
        contentView.addSubview(hotelIcon)
        contentView.addSubview(hotelName)
        contentView.addSubview(callIcon)
        contentView.addSubview(callLabel)
        
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            title.bottomAnchor.constraint(equalTo: hotelIcon.topAnchor, constant: -20),
            hotelIcon.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            hotelIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            hotelIcon.trailingAnchor.constraint(equalTo: hotelName.leadingAnchor, constant: -5),
            hotelIcon.widthAnchor.constraint(equalToConstant: 20),
            hotelIcon.heightAnchor.constraint(equalToConstant: 20),
            hotelName.centerYAnchor.constraint(equalTo: hotelIcon.centerYAnchor),
            hotelName.trailingAnchor.constraint(equalTo: callIcon.leadingAnchor, constant: -20),
            callIcon.centerYAnchor.constraint(equalTo: hotelIcon.centerYAnchor),
            callIcon.trailingAnchor.constraint(equalTo: callLabel.leadingAnchor, constant: -5),
            callIcon.widthAnchor.constraint(equalToConstant: 20),
            callIcon.heightAnchor.constraint(equalToConstant: 20),
            callLabel.centerYAnchor.constraint(equalTo: hotelIcon.centerYAnchor),
        ])
    }

}
