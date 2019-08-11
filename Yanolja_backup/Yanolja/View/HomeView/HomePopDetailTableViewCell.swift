//
//  HomePopDetailTableViewCell.swift
//  Yanolja
//
//  Created by Chunsu Kim on 07/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomePopDetailTableViewCell: UITableViewCell {

    static let identifier = "HomePopDetailTableViewCell"
    
    private let detailImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func configureCell() {
        detailImageView.contentMode = .scaleAspectFill
        detailImageView.layer.cornerRadius = 10
        detailImageView.clipsToBounds = true
        
        contentView.addSubview(detailImageView)
        
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        detailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        detailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        detailImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        detailImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        detailImageView.heightAnchor.constraint(equalToConstant: 260).isActive = true
    }
    
    func configurePopDetail(image: UIImage?) {
        detailImageView.image = image
    }
    
}
