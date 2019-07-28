//
//  RegisterSecondViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 28/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class RegisterSecondViewController: UIViewController {
    
    // MARK: - Properties
    
    // navigationView
    private let navigationView = UIView()
    private let dismissButton = UIButton(type: .custom)
    private let naviTitleLabel = UILabel()
    private let navigationViewBottomLine = UIView()
    
    private let descriptionImageView = UIImageView()
    
    // textField
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private let passwordConfirmTextField = UITextField()
    
    private let idLineView = UIView()
    private let passwordLineView = UIView()
    private let passwordConfirmLineView = UIView()
    
    
    // bottom NextButton
    private let buttonView = UIView()
    private let nextButton = UIButton()

    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        configureNavigationView()
        configureDescriptionImageView()
        configureTextField()
        configureNextButton()
        hideKeyboard()
    }
    
    
    // MARK: - Configuration
    
    // configuration navigationView
    private func configureNavigationView() {
        navigationView.backgroundColor = .white
        
        dismissButton.setImage(#imageLiteral(resourceName: "dismisslog"), for: .normal)
        dismissButton.contentMode = .scaleAspectFit
        dismissButton.addTarget(self, action: #selector(dismissButtonDidTap(_:)), for: .touchUpInside)
        
        naviTitleLabel.text = "회원가입 (2/3)"
        naviTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        naviTitleLabel.textColor = .black
        naviTitleLabel.textAlignment = .center
        
        navigationViewBottomLine.backgroundColor = #colorLiteral(red: 0.8774518967, green: 0.8826429248, blue: 0.8780108094, alpha: 1)
        
        view.addSubview(navigationView)
        navigationView.addSubview(dismissButton)
        navigationView.addSubview(naviTitleLabel)
        view.addSubview(navigationViewBottomLine)
        
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        navigationView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navigationView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.centerYAnchor.constraint(equalTo: naviTitleLabel.centerYAnchor).isActive = true
        dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        dismissButton.heightAnchor.constraint(equalTo: navigationView.heightAnchor).isActive = true
        
        naviTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        naviTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        naviTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        naviTitleLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        naviTitleLabel.heightAnchor.constraint(equalTo: navigationView.heightAnchor).isActive = true
        
        navigationViewBottomLine.translatesAutoresizingMaskIntoConstraints = false
        navigationViewBottomLine.topAnchor.constraint(equalTo: navigationView.bottomAnchor).isActive = true
        navigationViewBottomLine.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor).isActive = true
        navigationViewBottomLine.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor).isActive = true
        navigationViewBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    // imageView
    private func configureDescriptionImageView() {
        descriptionImageView.image = UIImage(named: "description")
        descriptionImageView.contentMode = .scaleAspectFit
        
        view.addSubview(descriptionImageView)
        
        descriptionImageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionImageView.topAnchor.constraint(equalTo: navigationViewBottomLine.bottomAnchor, constant: 10).isActive = true
        descriptionImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        descriptionImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        descriptionImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    // textField
    private func configureTextField() {
        idTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        idTextField.placeholder = "이메일"
        idTextField.enablesReturnKeyAutomatically = true
        idTextField.borderStyle = .none
        idTextField.returnKeyType = .next
        idTextField.autocorrectionType = .no
        idTextField.autocapitalizationType = .none
        idTextField.clearButtonMode = UITextField.ViewMode.always
        idTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        idTextField.delegate = self
        
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        passwordTextField.placeholder = "비밀번호 4자이상"
        passwordTextField.enablesReturnKeyAutomatically = true
        passwordTextField.borderStyle = .none
        passwordTextField.returnKeyType = .next
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.clearButtonMode = UITextField.ViewMode.always
        passwordTextField.isSecureTextEntry = true
        passwordTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        passwordTextField.delegate = self
        
        passwordConfirmTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        passwordConfirmTextField.placeholder = "비밀번호 확인"
        passwordConfirmTextField.enablesReturnKeyAutomatically = true
        passwordConfirmTextField.borderStyle = .none
        passwordConfirmTextField.autocorrectionType = .no
        passwordConfirmTextField.autocapitalizationType = .none
        passwordConfirmTextField.clearButtonMode = UITextField.ViewMode.always
        passwordConfirmTextField.isSecureTextEntry = true
        passwordConfirmTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        passwordConfirmTextField.delegate = self
        
        
        idLineView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        passwordLineView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        passwordConfirmLineView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        view.addSubview(idTextField)
        view.addSubview(idLineView)
        
        view.addSubview(passwordTextField)
        view.addSubview(passwordLineView)
        
        view.addSubview(passwordConfirmTextField)
        view.addSubview(passwordConfirmLineView)
        
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        idTextField.topAnchor.constraint(equalTo: descriptionImageView.bottomAnchor, constant: 70).isActive = true
        idTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        idTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
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
        
        passwordConfirmTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordConfirmTextField.topAnchor.constraint(equalTo: passwordLineView.bottomAnchor, constant: 50).isActive = true
        passwordConfirmTextField.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        passwordConfirmTextField.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
        passwordConfirmTextField.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor).isActive = true
        
        passwordConfirmLineView.translatesAutoresizingMaskIntoConstraints = false
        passwordConfirmLineView.topAnchor.constraint(equalTo: passwordConfirmTextField.bottomAnchor, constant: 5).isActive = true
        passwordConfirmLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        passwordConfirmLineView.leadingAnchor.constraint(equalTo: passwordLineView.leadingAnchor).isActive = true
        passwordConfirmLineView.trailingAnchor.constraint(equalTo: passwordLineView.trailingAnchor).isActive = true
    }
    
    // configuration bottom next button
    var buttonViewOriginBottomPriority: NSLayoutConstraint?
    var buttonViewChangedBottomPriority: NSLayoutConstraint?
    
    private func configureNextButton() {
        let nextButtonStringValue = "다음\n이제 휴대폰 등록만 하면 회원가입 완료!"
        let nextButtonAttributedString: NSMutableAttributedString = NSMutableAttributedString(string: nextButtonStringValue)
        nextButtonAttributedString.setFontForText(textForAttribute: "다음", withFont: UIFont.systemFont(ofSize: 17, weight: .semibold))
        nextButtonAttributedString.setFontForText(textForAttribute: "이제 휴대폰 등록만 하면 회원가입 완료!", withFont: UIFont.systemFont(ofSize: 11, weight: .semibold))
        
        // configuration button title two lines
        nextButton.titleLabel?.attributedText = nextButtonAttributedString
        nextButton.setTitle("다음\n이제 휴대폰 등록만 하면 회원가입 완료!", for: .normal)
        nextButton.titleLabel?.numberOfLines = 0
        nextButton.titleLabel?.lineBreakMode = .byWordWrapping
        nextButton.titleLabel?.textAlignment = .center
        //
        nextButton.backgroundColor = .lightGray
        nextButton.layer.cornerRadius = 5
        
        nextButton.sizeToFit()
        nextButton.isEnabled = false
        nextButton.addTarget(self, action: #selector(nextButtonDidTap(_:)), for: .touchUpInside)
        
        let buttonLineView = UIView()
        buttonLineView.backgroundColor = #colorLiteral(red: 0.8774518967, green: 0.8826429248, blue: 0.8780108094, alpha: 1)
        
        buttonView.backgroundColor = .white
        
        view.addSubview(buttonView)
        buttonView.addSubview(nextButton)
        buttonView.addSubview(buttonLineView)
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.heightAnchor.constraint(equalToConstant: 62).isActive = true
        buttonView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        buttonView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true

        buttonViewOriginBottomPriority = buttonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        buttonViewOriginBottomPriority?.priority = UILayoutPriority(1000)
        buttonViewOriginBottomPriority?.isActive = true
        
        buttonViewChangedBottomPriority = buttonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -270)
        buttonViewChangedBottomPriority?.priority = UILayoutPriority(750)
        buttonViewChangedBottomPriority?.isActive = true
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.bottomAnchor.constraint(equalTo: buttonView.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: buttonView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: buttonView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        buttonLineView.translatesAutoresizingMaskIntoConstraints = false
        buttonLineView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -10).isActive = true
        buttonLineView.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor).isActive = true
        buttonLineView.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor).isActive = true
        buttonLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    
    // MARK: - Action Methods
    
    @objc private func dismissButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func nextButtonDidTap(_ sender: UIButton) {
        let thirdRegisterViewController = RegisterThirdViewController()
        show(thirdRegisterViewController, sender: nil)
    }
    
    @objc private func textFieldEditingChanged(_ sender: UITextField) {
        let id = idTextField.text
        let string = String()
        let passwordNecessary = (passwordTextField.text?.count)! + string.count > 4
        let passwordConfirm = (passwordConfirmTextField.text?.count)! + string.count > 4
        if !(id!.isEmpty) && passwordNecessary && passwordConfirm && (passwordNecessary == passwordConfirm) {
            nextButton.isEnabled = true
            nextButton.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.2039215686, blue: 0.4705882353, alpha: 1)
        } else {
            nextButton.isEnabled = false
            nextButton.backgroundColor = .lightGray
        }
    }
}

// MARK: - TextField Delegate
extension RegisterSecondViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        idTextField.resignFirstResponder()
        if textField == idTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
            passwordConfirmTextField.becomeFirstResponder()
        } else if textField == passwordConfirmTextField {
            passwordConfirmTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        buttonViewOriginBottomPriority?.isActive = false
        buttonViewChangedBottomPriority?.isActive = true
        
        return true
    }
}

// MARK: - Hide Keyboard Extension
extension RegisterSecondViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
        buttonViewChangedBottomPriority?.isActive = false
        buttonViewOriginBottomPriority?.isActive = true
        
    }
}
