//
//  TopNaviCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 08/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

protocol checkBoxDelegate {
    func possibleChkButton()
    func searchButton()
}

class TopNaviView: UIView {
    
    // MARK: - Properties
    
    var delegate: checkBoxDelegate?
    
    let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "grasses"), for: .normal)
        button.tintColor = UIColor.gray
        button.addTarget(self, action: #selector(searchButtonEvent), for: .touchUpInside)
        
        return button
    }()
    
    let locationText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "강남구 대치동"
        label.font = UIFont.systemFont(ofSize: 27, weight: .bold)
        
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
        button.setTitle("7월 9일 ~ 7월 10일, 1박", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.layer.borderWidth = 1
        
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
        
        return button
    }()
    
    let possibleChkButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("쿠폰 할인 가능한 숙소", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.black, for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setImage(#imageLiteral(resourceName: "is-checked_false"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "is-checked_true"), for: .selected)
        button.addTarget(self, action: #selector(checkboxTap), for: .touchUpInside)
        button.isSelected = false
        
        return button
    }()
    
    let filterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "filter"), for: .normal)
        
        return button
    }()
    
    let mapButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "map"), for: .normal)
        
        return button
    }()
    
    let divideLine: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        
        return label
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
        self.addSubview(possibleChkButton)
        self.addSubview(filterButton)
        self.addSubview(mapButton)
        self.addSubview(divideLine)
        
        configureAutoLayout()
    }
    
    private func configureAutoLayout() {
        
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            searchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            searchButton.widthAnchor.constraint(equalToConstant: 20),
            searchButton.heightAnchor.constraint(equalToConstant: 20),
            locationText.topAnchor.constraint(equalTo: self.topAnchor, constant: 45),
            locationText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            selectLocationButton.centerYAnchor.constraint(equalTo: locationText.centerYAnchor),
            selectLocationButton.leadingAnchor.constraint(equalTo: locationText.trailingAnchor, constant: 10),
            selectDateButton.topAnchor.constraint(equalTo: locationText.bottomAnchor, constant: 15),
            selectDateButton.leadingAnchor.constraint(equalTo: locationText.leadingAnchor),
            selectDateButton.widthAnchor.constraint(equalToConstant: 190),
            selectDateButton.heightAnchor.constraint(equalToConstant: 30),
            selectHumanCountButton.centerYAnchor.constraint(equalTo: selectDateButton.centerYAnchor),
            selectHumanCountButton.leadingAnchor.constraint(equalTo: selectDateButton.trailingAnchor, constant: 10),
            selectHumanCountButton.widthAnchor.constraint(equalToConstant: 120),
            possibleChkButton.leadingAnchor.constraint(equalTo: selectDateButton.leadingAnchor),
            possibleChkButton.topAnchor.constraint(equalTo: selectDateButton.bottomAnchor, constant: 20),
            possibleChkButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -17),
            mapButton.centerYAnchor.constraint(equalTo: possibleChkButton.centerYAnchor, constant: -5),
            mapButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            mapButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -17),
            filterButton.centerYAnchor.constraint(equalTo: possibleChkButton.centerYAnchor),
            filterButton.trailingAnchor.constraint(equalTo: mapButton.leadingAnchor, constant: -20),
            filterButton.bottomAnchor.constraint(equalTo: divideLine.topAnchor, constant: -17),
            divideLine.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            divideLine.widthAnchor.constraint(equalTo: self.widthAnchor),
            divideLine.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    @objc private func checkboxTap() {
        delegate?.possibleChkButton()
    }
    
    @objc private func searchButtonEvent() {
        delegate?.searchButton()
    }

}
