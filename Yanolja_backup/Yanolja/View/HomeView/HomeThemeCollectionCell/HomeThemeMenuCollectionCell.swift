//
//  HomeThemeMenuCollectionCell.swift
//  Yanolja
//
//  Created by Chunsu Kim on 15/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomeThemeMenuCollectionCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "HomeThemeMenuCollectionCell"
    
    let menuLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLabel()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            menuLabel.textColor = isSelected ? .black : .lightGray
        }
    }
    
    // MARK: - Configuration Label and Constraints
    private func configureLabel() {
        menuLabel.text = "text"
        menuLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        menuLabel.textColor = .lightGray
        
        addSubview(menuLabel)
    }
    
    private func configureConstraints() {
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
        menuLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        menuLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
