//
//  DetailImageCollectionViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/23.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class DetailImageCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureImageView()
        configureImageViewConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    private func configureImageView() {
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        contentView.addSubview(imageView)
    }
    
    // MARK: - Configuration Constraints
    private func configureImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    // MARK: - Configuration global method
    func configureCellContent(image: UIImage?) {
        imageView.image = image
    }
}
