//
//  HotelTableViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/15.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HotelTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureDefaultCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureDefaultCell() {
        
    }
}
