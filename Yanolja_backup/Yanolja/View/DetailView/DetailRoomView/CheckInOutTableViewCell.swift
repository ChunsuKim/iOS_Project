//
//  CheckInOutTableViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/08/01.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class CheckInOutTableViewCell: UITableViewCell {

    let checkInOutView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let checkInView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let checkInTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "체크인"
        label.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    let checkInDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "7월 26일(금)"
        label.textColor = #colorLiteral(red: 0, green: 0.4470588235, blue: 0.6980392157, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        return label
    }()
    
    let checkOutView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let checkOutTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "체크아웃"
        label.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    let checkOutDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "7월 26일(금)"
        label.textColor = #colorLiteral(red: 0, green: 0.4470588235, blue: 0.6980392157, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        contentView.addSubview(checkInOutView)
        
        checkInOutView.addSubview(checkInView)
        checkInView.addSubview(checkInTitle)
        checkInView.addSubview(checkInDate)
        checkInOutView.addSubview(checkOutView)
        checkOutView.addSubview(checkOutTitle)
        checkOutView.addSubview(checkOutDate)
        
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            checkInOutView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            checkInOutView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            checkInOutView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
//            checkInOutView.heightAnchor.constraint(equalToConstant: 70),
            checkInOutView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            checkInOutView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -40),
            
            checkInView.topAnchor.constraint(equalTo: checkInOutView.topAnchor),
            checkInView.leadingAnchor.constraint(equalTo: checkInOutView.leadingAnchor),
            checkInView.widthAnchor.constraint(equalTo: checkInOutView.widthAnchor, multiplier: 0.5),
            checkInView.bottomAnchor.constraint(equalTo: checkInOutView.bottomAnchor),
            checkInView.trailingAnchor.constraint(equalTo: checkOutView.leadingAnchor),
            checkInTitle.topAnchor.constraint(equalTo: checkInView.topAnchor, constant: 10),
            checkInTitle.centerXAnchor.constraint(equalTo: checkInView.centerXAnchor),
            checkInTitle.bottomAnchor.constraint(equalTo: checkInDate.topAnchor),
            checkInDate.centerXAnchor.constraint(equalTo: checkInTitle.centerXAnchor),
            checkInDate.bottomAnchor.constraint(equalTo: checkInView.bottomAnchor, constant: -10),
            
            checkOutView.topAnchor.constraint(equalTo: checkInView.topAnchor),
            checkOutView.trailingAnchor.constraint(equalTo: checkInOutView.trailingAnchor),
            checkOutView.bottomAnchor.constraint(equalTo: checkInView.bottomAnchor),
            checkOutView.widthAnchor.constraint(equalTo: checkInView.widthAnchor),
            checkOutTitle.topAnchor.constraint(equalTo: checkOutView.topAnchor, constant: 10),
            checkOutTitle.centerXAnchor.constraint(equalTo: checkOutView.centerXAnchor),
            checkOutTitle.bottomAnchor.constraint(equalTo: checkOutDate.topAnchor),
            checkOutDate.centerXAnchor.constraint(equalTo: checkOutTitle.centerXAnchor),
            checkOutDate.bottomAnchor.constraint(equalTo: checkOutView.bottomAnchor, constant: -10),
        ])
    }

}
