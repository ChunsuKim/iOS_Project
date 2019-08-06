//
//  SearchDetailDefaultTableViewCell.swift
//  Yanolja
//
//  Created by brian은석 on 06/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class SearchDetailDefaultTableViewCell: UITableViewCell {

    let nothingImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeView()
        
    }
    private func makeView() {
        self.addSubview(nothingImageView)
        nothingImageView.translatesAutoresizingMaskIntoConstraints = false
        nothingImageView.topAnchor.constraint(equalTo: topAnchor,constant: 10).isActive = true
        nothingImageView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -30).isActive = true
        nothingImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10).isActive = true
        nothingImageView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10).isActive = true
        nothingImageView.image = #imageLiteral(resourceName: "defaultSearchDetailTableViewCellImage")

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
