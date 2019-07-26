//
//  LoginEasyCollectionViewCell.swift
//  Yanolja
//
//  Created by Chunsu Kim on 24/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class LoginEasyCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "LoginEasyCollectionViewCell"
    
    // label
    private let descriptionLabel = UILabel()
    private let descriptionBottonLabel = UILabel()
    
    // button
    private let faceIdLoginButton = UIButton(type: .custom)
    private let cellphoneLoginButton = UIButton(type: .custom)
    private let naverLoginButton = UIButton(type: .custom)
    private let paycoLoginButton = UIButton(type: .custom)
    
    // MARK: - Init Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLabel()
        configureButtons()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    
    // label
    private func configureLabel() {
        descriptionLabel.backgroundColor = #colorLiteral(red: 0.9452576041, green: 0.9459609389, blue: 0.9487840533, alpha: 1)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        descriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "\n 간편 로그인을 위해서는 야놀자 계정으로 가입 후, \n 계정 연동이 필요합니다."
        
        descriptionBottonLabel.backgroundColor = #colorLiteral(red: 0.9452576041, green: 0.9459609389, blue: 0.9487840533, alpha: 1)
        
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(descriptionBottonLabel)
    }
    
    // buttons
    private func configureButtons() {
        faceIdLoginButton.setImage(UIImage(named: "faceid"), for: .normal)
        faceIdLoginButton.contentMode = .scaleAspectFit
        
        cellphoneLoginButton.setImage(UIImage(named: "cellphone"), for: .normal)
        cellphoneLoginButton.contentMode = .scaleAspectFit
        
        naverLoginButton.setImage(#imageLiteral(resourceName: "naverlog"), for: .normal)
        naverLoginButton.contentMode = .scaleAspectFit
        naverLoginButton.layer.borderWidth = 1
        naverLoginButton.layer.borderColor = #colorLiteral(red: 0.5140212178, green: 0.8387483954, blue: 0.5067048669, alpha: 1)
        
        paycoLoginButton.setImage(#imageLiteral(resourceName: "paycolog"), for: .normal)
        paycoLoginButton.contentMode = .scaleAspectFit
        paycoLoginButton.layer.borderWidth = 1
        paycoLoginButton.layer.borderColor = #colorLiteral(red: 0.9108096361, green: 0.3724268675, blue: 0.3745743632, alpha: 1)
        
        contentView.addSubview(faceIdLoginButton)
        contentView.addSubview(cellphoneLoginButton)
        contentView.addSubview(naverLoginButton)
        contentView.addSubview(paycoLoginButton)
    }
    
    // MARK: - Configuration Constraints
    private func configureConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        descriptionBottonLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionBottonLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor).isActive = true
        descriptionBottonLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor).isActive = true
        descriptionBottonLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor).isActive = true
        descriptionBottonLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        faceIdLoginButton.translatesAutoresizingMaskIntoConstraints = false
        faceIdLoginButton.topAnchor.constraint(equalTo: descriptionBottonLabel.bottomAnchor, constant: 40).isActive = true
        faceIdLoginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50).isActive = true
        faceIdLoginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50).isActive = true
        faceIdLoginButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        cellphoneLoginButton.translatesAutoresizingMaskIntoConstraints = false
        cellphoneLoginButton.topAnchor.constraint(equalTo: faceIdLoginButton.bottomAnchor, constant: 20).isActive = true
        cellphoneLoginButton.leadingAnchor.constraint(equalTo: faceIdLoginButton.leadingAnchor).isActive = true
        cellphoneLoginButton.trailingAnchor.constraint(equalTo: faceIdLoginButton.trailingAnchor).isActive = true
        cellphoneLoginButton.heightAnchor.constraint(equalTo: faceIdLoginButton.heightAnchor).isActive = true
        
        naverLoginButton.translatesAutoresizingMaskIntoConstraints = false
        naverLoginButton.topAnchor.constraint(equalTo: cellphoneLoginButton.bottomAnchor, constant: 20).isActive = true
        naverLoginButton.leadingAnchor.constraint(equalTo: cellphoneLoginButton.leadingAnchor).isActive = true
        naverLoginButton.trailingAnchor.constraint(equalTo: cellphoneLoginButton.trailingAnchor).isActive = true
        naverLoginButton.heightAnchor.constraint(equalTo: cellphoneLoginButton.heightAnchor).isActive = true
        
        paycoLoginButton.translatesAutoresizingMaskIntoConstraints = false
        paycoLoginButton.topAnchor.constraint(equalTo: naverLoginButton.bottomAnchor, constant: 20).isActive = true
        paycoLoginButton.leadingAnchor.constraint(equalTo: naverLoginButton.leadingAnchor).isActive = true
        paycoLoginButton.trailingAnchor.constraint(equalTo: naverLoginButton.trailingAnchor).isActive = true
        paycoLoginButton.heightAnchor.constraint(equalTo: naverLoginButton.heightAnchor).isActive = true
        
        
    }
}
