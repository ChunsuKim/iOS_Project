//
//  FilterThemeCollectionViewCell.swift
//  Yanolja
//
//  Created by brian은석 on 13/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

protocol CountDelegate {
    func plusCount(count:Int)
}

class FilterThemeCollectionViewCell: UICollectionViewCell {
    let button = UIButton()
    let collectionViewCellTitleLabel = UILabel()
    var selectCount = 0
    
    var delegate: CountDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeView()

    }
    private func makeView() {
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75).isActive = true
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        
        self.addSubview(collectionViewCellTitleLabel)
        collectionViewCellTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionViewCellTitleLabel.topAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        collectionViewCellTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionViewCellTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionViewCellTitleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25).isActive = true
        collectionViewCellTitleLabel.textAlignment = .center
        collectionViewCellTitleLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        collectionViewCellTitleLabel.textColor = #colorLiteral(red: 0.7348349094, green: 0.7389728427, blue: 0.7457159162, alpha: 1)
    }
    
    @objc func buttonAction(sender:UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            button.tintColor = singleTon.mainColor
             selectCount = 1
            delegate?.plusCount(count: selectCount)
           
        } else {
            button.tintColor = #colorLiteral(red: 0.7348349094, green: 0.7389728427, blue: 0.7457159162, alpha: 1)
            selectCount = -1
            delegate?.plusCount(count: selectCount)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
