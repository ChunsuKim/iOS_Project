//
//  TopNaviCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 08/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class TopNaviCell: UIView {

    let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "grasses"), for: .normal)
        button.tintColor = UIColor.gray
        
        return button
    }()
    
    let locationText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "강남구 대치동"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        return label
    }()
    
    let selectLocationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "mylocad"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        
        return button
    }()
    
    let selectDateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("7월 8일 ~ 7월 9일, 1박", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.layer.borderWidth = 1
        button.titleEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        
        return button
    }()
    
    let selectHumanCountButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("성인 2, 아동 0", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.layer.borderWidth = 1
        button.titleEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureNavi()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureNavi() {
        self.addSubview(searchButton)
        self.addSubview(locationText)
        self.addSubview(selectLocationButton)
        self.addSubview(selectDateButton)
        self.addSubview(selectHumanCountButton)
        
        configureAutoLayout()
    }
    
    private func configureAutoLayout() {
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            searchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            searchButton.widthAnchor.constraint(equalToConstant: 20),
            searchButton.heightAnchor.constraint(equalToConstant: 20),
            locationText.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            locationText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            selectLocationButton.centerYAnchor.constraint(equalTo: locationText.centerYAnchor),
            selectLocationButton.leadingAnchor.constraint(equalTo: locationText.trailingAnchor, constant: 10),
            selectDateButton.topAnchor.constraint(equalTo: locationText.bottomAnchor, constant: 20),
            selectDateButton.leadingAnchor.constraint(equalTo: locationText.leadingAnchor),
            selectHumanCountButton.centerYAnchor.constraint(equalTo: selectDateButton.centerYAnchor),
            selectHumanCountButton.leadingAnchor.constraint(equalTo: selectDateButton.trailingAnchor, constant: 10),
        ])
    }

}
