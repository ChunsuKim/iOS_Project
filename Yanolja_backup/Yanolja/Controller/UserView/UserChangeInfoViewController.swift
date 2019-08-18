//
//  UserChangeInfoViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 16/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class UserChangeInfoViewController: UIViewController {
    
    // navigationView
    private let navigationView = UIView()
    private let dismissButton = UIButton(type: .custom)
    private let loginTitleLabel = UILabel()
    private let navigationBottomLine = UIView()
    
    private let nicknameTextField = UITextField()
    private let nicknameLineView = UIView()
    
    private let savingButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        configureNavigationView()
        configureNavigationViewConstraints()
        configureTextField()
        configureButton()
        configureTextFieldConstraints()
        configureButtonConstraints()
    }
    
    // MARK: - Configuration
    
    // navigationView
    private func configureNavigationView() {
        navigationView.backgroundColor = .white
        
        dismissButton.setImage(#imageLiteral(resourceName: "dismisslog"), for: .normal)
        dismissButton.contentMode = .scaleAspectFit
        dismissButton.addTarget(self, action: #selector(dismissButtonDidTap(_:)), for: .touchUpInside)
        
        loginTitleLabel.text = "내 정보 수정"
        loginTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        loginTitleLabel.textColor = .black
        loginTitleLabel.textAlignment = .center
        
        navigationBottomLine.backgroundColor = #colorLiteral(red: 0.6949326396, green: 0.6987475753, blue: 0.6951570511, alpha: 1)
        
        view.addSubview(navigationView)
        navigationView.addSubview(dismissButton)
        navigationView.addSubview(loginTitleLabel)
        view.addSubview(navigationBottomLine)
    }
    
    private func configureTextField() {
        nicknameTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        nicknameTextField.placeholder = "변경할 닉네임을 입력해주세요"
        nicknameTextField.enablesReturnKeyAutomatically = true
        nicknameTextField.borderStyle = .none
//        nicknameTextField.returnKeyType = .next
        nicknameTextField.autocorrectionType = .no
        nicknameTextField.autocapitalizationType = .none
        nicknameTextField.clearButtonMode = UITextField.ViewMode.always
        nicknameTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
        nicknameLineView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        view.addSubview(nicknameTextField)
        view.addSubview(nicknameLineView)
    }
    
    private func configureButton() {
        
        savingButton.setTitle("저장하기", for: .normal)
        savingButton.setTitleColor(.white, for: .normal)
        savingButton.backgroundColor = .lightGray
        savingButton.isEnabled = false
        savingButton.layer.cornerRadius = 7
        savingButton.addTarget(self, action: #selector(savingButtonDidTap(_:)), for: .touchUpInside)
        
        view.addSubview(savingButton)
    }
    
    // MARK: - Configuration Constraints
    private func configureNavigationViewConstraints() {
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        navigationView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navigationView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.centerYAnchor.constraint(equalTo: loginTitleLabel.centerYAnchor).isActive = true
        dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        dismissButton.heightAnchor.constraint(equalTo: navigationView.heightAnchor).isActive = true
        
        loginTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        loginTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTitleLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        loginTitleLabel.heightAnchor.constraint(equalTo: navigationView.heightAnchor).isActive = true
        
        navigationBottomLine.translatesAutoresizingMaskIntoConstraints = false
        navigationBottomLine.topAnchor.constraint(equalTo: navigationView.bottomAnchor).isActive = true
        navigationBottomLine.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor).isActive = true
        navigationBottomLine.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor).isActive = true
        navigationBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    private func configureTextFieldConstraints() {
        
        nicknameTextField.translatesAutoresizingMaskIntoConstraints = false
        nicknameTextField.topAnchor.constraint(equalTo: navigationBottomLine.bottomAnchor, constant: 60).isActive = true
        nicknameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        nicknameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        nicknameTextField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        nicknameLineView.translatesAutoresizingMaskIntoConstraints = false
        nicknameLineView.topAnchor.constraint(equalTo: nicknameTextField.bottomAnchor, constant: 5).isActive = true
        nicknameLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        nicknameLineView.leadingAnchor.constraint(equalTo: nicknameTextField.leadingAnchor, constant: -10).isActive = true
        nicknameLineView.trailingAnchor.constraint(equalTo: nicknameTextField.trailingAnchor, constant: 10).isActive = true
        
    }
    
    private func configureButtonConstraints() {
        
        savingButton.translatesAutoresizingMaskIntoConstraints = false
        savingButton.topAnchor.constraint(equalTo: nicknameLineView.bottomAnchor, constant: 60).isActive = true
        savingButton.leadingAnchor.constraint(equalTo: nicknameLineView.leadingAnchor).isActive = true
        savingButton.trailingAnchor.constraint(equalTo: nicknameLineView.trailingAnchor).isActive = true
        savingButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // MARK: - Action Method
    @objc private func dismissButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func textFieldEditingChanged(_ sender: UITextField) {
        let id = nicknameTextField.text
        let string = String()
        if !(id!.isEmpty) && (id?.count)! + string.count > 1 {
            savingButton.isEnabled = true
            savingButton.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.2039215686, blue: 0.4705882353, alpha: 1)
        } else {
            savingButton.isEnabled = false
            savingButton.backgroundColor = .lightGray
        }
    }
    
    @objc private func savingButtonDidTap(_ sender: UIButton) {
        
    }

}


// MARK: - Hide Keyboard Extension
extension UserChangeInfoViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
