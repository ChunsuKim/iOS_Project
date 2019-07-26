//
//  LoginMenuCollectionViewCell.swift
//  Yanolja
//
//  Created by Chunsu Kim on 23/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class LoginMenuCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "LoginMenuCollectionViewCell"
    
    let loginMenuLabel = UILabel()
    
    // MARK: - Init Method
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
            loginMenuLabel.textColor = isSelected ? .black : .lightGray
        }
    }
    
    // MARK: - Configuration Label and Constraints
    private func configureLabel() {
        loginMenuLabel.text = "text"
        loginMenuLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        loginMenuLabel.textColor = .lightGray
        
        addSubview(loginMenuLabel)
    }
    
    private func configureConstraints() {
        loginMenuLabel.translatesAutoresizingMaskIntoConstraints = false
        loginMenuLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginMenuLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}


