//
//  UserViewLoginTableViewCell.swift
//  Yanolja
//
//  Created by Chunsu Kim on 24/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class UserViewLoginTableViewCell: UITableViewCell {
    
    static let identifier = "UserViewLoginTableViewCell"
    
    private let loginOrRegisterLabel = UILabel()
    private let rightImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        configureViews()
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
    
    private func configureViews() {
        loginOrRegisterLabel.text = "로그인 및 회원가입"
        loginOrRegisterLabel.textColor = #colorLiteral(red: 0.9960784314, green: 0.2039215686, blue: 0.4705882353, alpha: 1)
        loginOrRegisterLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        rightImageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(loginOrRegisterLabel)
        contentView.addSubview(rightImageView)
        
        loginOrRegisterLabel.translatesAutoresizingMaskIntoConstraints = false
        loginOrRegisterLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22).isActive = true
        loginOrRegisterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        loginOrRegisterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        loginOrRegisterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22).isActive = true
        
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        rightImageView.centerYAnchor.constraint(equalTo: loginOrRegisterLabel.centerYAnchor).isActive = true
        rightImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        rightImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        rightImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    func configureInputValue(text: String, textColor: UIColor, image: UIImage?) {
        loginOrRegisterLabel.text = text
        loginOrRegisterLabel.textColor = textColor
        rightImageView.image = image
    }
}
