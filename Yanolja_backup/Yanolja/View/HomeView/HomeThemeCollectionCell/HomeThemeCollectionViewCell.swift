//
//  HomeCollectionViewCell.swift
//  Yanolja
//
//  Created by Chunsu Kim on 08/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomeThemeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "HomeThemeCollectionViewCell"
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let priceLabel = UILabel()
    private let wonLabel = UILabel()
    
    // MARK: - Init Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    private func configureViews() {
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 7
        
        // imageView
        imageView.contentMode = .scaleAspectFill
        contentView.addSubview(imageView)
        
        // titleLabel
        titleLabel.textAlignment = .left
        titleLabel.textColor = .black
        titleLabel.backgroundColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        contentView.addSubview(titleLabel)
        
        // priceLabel
        priceLabel.textAlignment = .right
        priceLabel.textColor = .black
        priceLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        priceLabel.text = "340,000"
        contentView.addSubview(priceLabel)
        
        // wonLabel
        wonLabel.textAlignment = .left
        wonLabel.textColor = .black
        wonLabel.font = UIFont.systemFont(ofSize: 13, weight: .ultraLight)
        wonLabel.text = "원"
        contentView.addSubview(wonLabel)
    }
    
    // MARK: - Configuration Constraints
    private func configureConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        
        wonLabel.translatesAutoresizingMaskIntoConstraints = false
        wonLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        wonLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        wonLabel.widthAnchor.constraint(equalToConstant: 15).isActive = true
        wonLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: wonLabel.leadingAnchor).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

    }
    
    // MARK: - configuration global method
    func configureCellContent(image: String, title: String, price: String) {
        imageView.downloadImageFrom(image, contentMode: .scaleAspectFill)
        titleLabel.text = title
        priceLabel.text = price
    }
}
