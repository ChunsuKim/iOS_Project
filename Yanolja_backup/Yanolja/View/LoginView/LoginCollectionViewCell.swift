//
//  LoginCollectionViewCell.swift
//  Yanolja
//
//  Created by Chunsu Kim on 23/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class LoginCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "LoginCollectionViewCell"
    var registerButtonAction: (() -> ())?
    var loginButtonAction: (() -> ())?
    
    // textField
    let idTextField = UITextField()
    let passwordTextField = UITextField()
    
    private let idLineView = UIView()
    private let passwordLineView = UIView()
    
    // Buttons
    let loginButton = UIButton(type: .system)
    private let passwordResetButton = UIButton(type: .system)
    private let passwordResetButtonLineView = UIView()
    let registerButton = UIButton(type: .system)
    
    // MARK: - Init Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureTextField()
        configureButton()
        configureTextFieldConstraints()
        configureButtonConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    
    // textField
    private func configureTextField() {
        idTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        idTextField.placeholder = "아이디 또는 이메일"
        idTextField.enablesReturnKeyAutomatically = true
        idTextField.borderStyle = .none
        idTextField.returnKeyType = .next
        idTextField.autocorrectionType = .no
        idTextField.autocapitalizationType = .none
        idTextField.clearButtonMode = UITextField.ViewMode.always
        idTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        idTextField.delegate = self
        
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.enablesReturnKeyAutomatically = true
        passwordTextField.borderStyle = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.clearButtonMode = UITextField.ViewMode.always
        passwordTextField.isSecureTextEntry = true
        passwordTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        passwordTextField.delegate = self
        
        
        idLineView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        passwordLineView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        contentView.addSubview(idTextField)
        contentView.addSubview(idLineView)
        
        contentView.addSubview(passwordTextField)
        contentView.addSubview(passwordLineView)
    }
    
    // button
    private func configureButton() {
        
        loginButton.setTitle("로그인", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .lightGray
        loginButton.isEnabled = false
        loginButton.addTarget(self, action: #selector(loginButtonDidTap(_:)), for: .touchUpInside)
        
        passwordResetButton.setTitle("비밀번호 재설정", for: .normal)
        passwordResetButton.setTitleColor(#colorLiteral(red: 0.2375472188, green: 0.4117342234, blue: 0.9218910933, alpha: 1), for: .normal)
        passwordResetButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        
        passwordResetButtonLineView.backgroundColor = #colorLiteral(red: 0.2375472188, green: 0.4117342234, blue: 0.9218910933, alpha: 1)
        
        registerButton.layer.borderWidth = 1
        registerButton.layer.borderColor = #colorLiteral(red: 0.9960784314, green: 0.2039215686, blue: 0.4705882353, alpha: 1)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        registerButton.setTitle("야놀자 회원가입", for: .normal)
        registerButton.setTitleColor(#colorLiteral(red: 0.9960784314, green: 0.2039215686, blue: 0.4705882353, alpha: 1), for: .normal)
        registerButton.addTarget(self, action: #selector(registerButtonDidTap(_:)), for: .touchUpInside)
        
        contentView.addSubview(loginButton)
        contentView.addSubview(passwordResetButton)
        contentView.addSubview(passwordResetButtonLineView)
        contentView.addSubview(registerButton)
    }
    
    // MARK: - Configuration Constraints
    
    // textField
    private func configureTextFieldConstraints() {
        
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        idTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60).isActive = true
        idTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60).isActive = true
        idTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60).isActive = true
        idTextField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        idLineView.translatesAutoresizingMaskIntoConstraints = false
        idLineView.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 5).isActive = true
        idLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        idLineView.leadingAnchor.constraint(equalTo: idTextField.leadingAnchor, constant: -10).isActive = true
        idLineView.trailingAnchor.constraint(equalTo: idTextField.trailingAnchor, constant: 10).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: idLineView.bottomAnchor, constant: 50).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: idTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: idTextField.trailingAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: idTextField.heightAnchor).isActive = true
        
        passwordLineView.translatesAutoresizingMaskIntoConstraints = false
        passwordLineView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5).isActive = true
        passwordLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        passwordLineView.leadingAnchor.constraint(equalTo: idLineView.leadingAnchor).isActive = true
        passwordLineView.trailingAnchor.constraint(equalTo: idLineView.trailingAnchor).isActive = true
    }
    
    // button
    private func configureButtonConstraints() {
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: passwordLineView.bottomAnchor, constant: 60).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: passwordLineView.leadingAnchor).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: passwordLineView.trailingAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        passwordResetButton.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor).isActive = true
        passwordResetButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
        passwordResetButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        passwordResetButtonLineView.translatesAutoresizingMaskIntoConstraints = false
        passwordResetButtonLineView.topAnchor.constraint(equalTo: passwordResetButton.bottomAnchor, constant: 3).isActive = true
        passwordResetButtonLineView.leadingAnchor.constraint(equalTo: passwordResetButton.leadingAnchor, constant: -5).isActive = true
        passwordResetButtonLineView.trailingAnchor.constraint(equalTo: passwordResetButton.trailingAnchor, constant: 5).isActive = true
        passwordResetButtonLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.topAnchor.constraint(equalTo: passwordResetButtonLineView.bottomAnchor, constant: 40).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalTo: loginButton.heightAnchor).isActive = true
    }
    
    @objc private func registerButtonDidTap(_ sender: UIButton) {
        registerButtonAction?()
    }
    
    @objc private func loginButtonDidTap(_ sender: UIButton) {
        loginButtonAction?()
    }
    
    @objc private func textFieldEditingChanged(_ sender: UITextField) {
        let id = idTextField.text
        let string = String()
        if !(id!.isEmpty) && (passwordTextField.text?.count)! + string.count > 3 {
            loginButton.isEnabled = true
            loginButton.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.2039215686, blue: 0.4705882353, alpha: 1)
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = .lightGray
        }
    }
}

extension LoginCollectionViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        idTextField.resignFirstResponder()
        if textField == idTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
}


