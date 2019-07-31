//
//  FacilitiesCollectionViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/31.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class FacilitiesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let cont: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(icon)
        contentView.addSubview(cont)
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure Constraints
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: contentView.topAnchor),
            icon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            icon.bottomAnchor.constraint(equalTo: cont.topAnchor, constant: -10),
            cont.centerXAnchor.constraint(equalTo: icon.centerXAnchor),
            cont.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
