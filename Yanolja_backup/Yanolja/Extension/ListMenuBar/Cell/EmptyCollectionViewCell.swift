//
//  EmptyCollectionViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/08/16.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class EmptyCollectionViewCell: UICollectionViewCell {
    
    let emptyIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "defaultSearchDetailTableViewCellImage")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(emptyIcon)
        
        configureAutoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAutoLayout() {
        NSLayoutConstraint.activate([
            emptyIcon.topAnchor.constraint(equalTo: contentView.topAnchor),
            emptyIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            emptyIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            emptyIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
