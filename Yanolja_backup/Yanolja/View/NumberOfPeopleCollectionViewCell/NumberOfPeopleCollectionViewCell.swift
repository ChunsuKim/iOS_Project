//
//  NumberOfPeopleCollectionViewCell.swift
//  Yanolja
//
//  Created by brian은석 on 26/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class NumberOfPeopleCollectionViewCell: UICollectionViewCell {
    
    // MARK: -properties
    let titleLabel = UILabel()
    let barView = UIView()
    let ageOfLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        confirgureUI()
    }
    private func confirgureUI() {
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        titleLabel.textColor = #colorLiteral(red: 0.7240023017, green: 0.7281435728, blue: 0.7349153161, alpha: 1)
        titleLabel.text = "아동 1"
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.textAlignment = .center
        
        self.addSubview(barView)
        barView.translatesAutoresizingMaskIntoConstraints = false
        barView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        barView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 6).isActive = true
        barView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -6).isActive = true
        barView.backgroundColor = #colorLiteral(red: 0.9623243213, green: 0.9664420485, blue: 0.9692427516, alpha: 1)
        barView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: barView.topAnchor).isActive = true

        
        self.addSubview(ageOfLabel)
        ageOfLabel.translatesAutoresizingMaskIntoConstraints = false
        ageOfLabel.topAnchor.constraint(equalTo: barView.bottomAnchor).isActive = true
        ageOfLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        ageOfLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        ageOfLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        ageOfLabel.text = "나이 선택"
        ageOfLabel.textColor = #colorLiteral(red: 0.3669513464, green: 0.5835806727, blue: 0.6841617227, alpha: 1)
        ageOfLabel.font = UIFont.systemFont(ofSize: 13,weight: .medium)
        ageOfLabel.textAlignment = .center
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
