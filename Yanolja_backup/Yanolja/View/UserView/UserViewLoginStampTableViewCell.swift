//
//  UserViewLoginStampTableViewCell.swift
//  Yanolja
//
//  Created by Chunsu Kim on 25/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class UserViewLoginStampTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "UserViewLoginStampTableViewCell"
    
    private let stampImageView = UIImageView()
    
    
    // MARK: - Init Method
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        configureStampImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Configuration
    private func configureStampImageView() {
        stampImageView.contentMode = .scaleAspectFill
        
        contentView.addSubview(stampImageView)
        
        stampImageView.translatesAutoresizingMaskIntoConstraints = false
        stampImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stampImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stampImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stampImageView.heightAnchor.constraint(equalToConstant: 63).isActive = true
        stampImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    // MARK: - Globar Input Method
    func configureStampImageInput(image: UIImage?) {
        stampImageView.image = image
    }

}
