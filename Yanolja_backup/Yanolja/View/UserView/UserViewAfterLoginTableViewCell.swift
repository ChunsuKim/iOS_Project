//
//  UserViewAfterLoginTableViewCell.swift
//  Yanolja
//
//  Created by Chunsu Kim on 08/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class UserViewAfterLoginTableViewCell: UITableViewCell {

    // MARK: - Properties
    static let identifier = "UserViewAfterLoginTableViewCell"
    
    private let nickNameLabel = UILabel()
    private let emailLabel = UILabel()
    private let leftImageView = UIImageView()
    private let modifyImageView = UIImageView()
    
    
    // MARK: - Init Method
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
    
    // MARK: - Configuration
    private func configureViews() {
        nickNameLabel.text = ""
        nickNameLabel.textColor = .black
        nickNameLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        emailLabel.text = ""
        emailLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        emailLabel.font = UIFont.systemFont(ofSize: 10, weight: .light)
        
        leftImageView.contentMode = .scaleAspectFit
        
        modifyImageView.image = UIImage(named: "modify")
        modifyImageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(nickNameLabel)
        contentView.addSubview(emailLabel)
        contentView.addSubview(leftImageView)
        contentView.addSubview(modifyImageView)
        
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        leftImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        leftImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        leftImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        leftImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        nickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        nickNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        nickNameLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 20).isActive = true
//        nickNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        nickNameLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
//        nickNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22).isActive = true
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.topAnchor.constraint(equalTo: nickNameLabel.bottomAnchor, constant: 2).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: nickNameLabel.leadingAnchor).isActive = true
//        emailLabel.trailingAnchor.constraint(equalTo: nickNameLabel.trailingAnchor).isActive = true
        emailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12).isActive = true
        
        modifyImageView.translatesAutoresizingMaskIntoConstraints = false
        modifyImageView.leadingAnchor.constraint(equalTo: nickNameLabel.trailingAnchor, constant: 10).isActive = true
        modifyImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        modifyImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        modifyImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    // MARK: - Globar Input Method
    func configureLoginInputValue(nickName: String, email: String, image: UIImage?) {
        nickNameLabel.text = nickName
        emailLabel.text = email
        leftImageView.image = image
    }
    
    @objc private func selectModifyCell(_ sender: UIButton) {
        
    }
}

