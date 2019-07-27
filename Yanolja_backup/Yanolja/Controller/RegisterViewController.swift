//
//  RegisterViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 27/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    private let navigationView = UIView()
    private let dismissButton = UIButton(type: .custom)
    private let naviTitleLabel = UILabel()
    private let navigationViewBottomLine = UIView()
    
    private let nextButton = UIButton()
    
    private let totalCheckBox = UIButton(type: .custom)
    private let totalAgreeLabel = UILabel()
    private let totalAgreeBottomLine = UIView()
    
    private let ageCheckBox = UIButton(type: .custom)
    private let serviceCheckBox = UIButton(type: .custom)
    private let privacyCheckBox = UIButton(type: .custom)
    
    private let ageAgreeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        configureNavigationView()
        configureTotalAgreeButtonAndLabel()
        configureNextButton()
        configureCheckBox()
        configureLabels()
    }
    
    private func configureNavigationView() {
        navigationView.backgroundColor = .white
        
        dismissButton.setImage(#imageLiteral(resourceName: "dismisslog"), for: .normal)
        dismissButton.contentMode = .scaleAspectFit
        dismissButton.addTarget(self, action: #selector(dismissButtonDidTap(_:)), for: .touchUpInside)
        
        naviTitleLabel.text = "회원가입 (1/3)"
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
    
    private func configureTotalAgreeButtonAndLabel() {
        totalCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
        totalCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        totalCheckBox.addTarget(self, action: #selector(totalCheckBoxClicked(_:)), for: .touchUpInside)
        
        totalAgreeLabel.text = "전체 동의"
        totalAgreeLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        totalAgreeBottomLine.backgroundColor = #colorLiteral(red: 0.8774518967, green: 0.8826429248, blue: 0.8780108094, alpha: 1)
        
        view.addSubview(totalCheckBox)
        view.addSubview(totalAgreeLabel)
        view.addSubview(totalAgreeBottomLine)
        
        totalCheckBox.translatesAutoresizingMaskIntoConstraints = false
        totalCheckBox.topAnchor.constraint(equalTo: navigationViewBottomLine.bottomAnchor, constant: 50).isActive = true
        totalCheckBox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        totalCheckBox.widthAnchor.constraint(equalToConstant: 25).isActive = true
        totalCheckBox.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        totalAgreeLabel.translatesAutoresizingMaskIntoConstraints = false
        totalAgreeLabel.centerYAnchor.constraint(equalTo: totalCheckBox.centerYAnchor).isActive = true
        totalAgreeLabel.leadingAnchor.constraint(equalTo: totalCheckBox.trailingAnchor, constant: 10).isActive = true
        totalAgreeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45).isActive = true
        totalAgreeLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        totalAgreeBottomLine.translatesAutoresizingMaskIntoConstraints = false
        totalAgreeBottomLine.topAnchor.constraint(equalTo: totalAgreeLabel.bottomAnchor, constant: 15).isActive = true
        totalAgreeBottomLine.leadingAnchor.constraint(equalTo: totalCheckBox.leadingAnchor, constant: -5).isActive = true
        totalAgreeBottomLine.trailingAnchor.constraint(equalTo: totalAgreeLabel.trailingAnchor, constant: -5).isActive = true
        totalAgreeBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    private func configureNextButton() {
        
        nextButton.setTitle("다음", for: .normal)
        nextButton.backgroundColor = .lightGray
        nextButton.layer.cornerRadius = 5
        
        view.addSubview(nextButton)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    private func configureCheckBox() {
        
        ageCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
        ageCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        ageCheckBox.addTarget(self, action: #selector(checkBoxClicked(_:)), for: .touchUpInside)
        
        serviceCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
        serviceCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        serviceCheckBox.addTarget(self, action: #selector(checkBoxClicked(_:)), for: .touchUpInside)
        
        privacyCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
        privacyCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        privacyCheckBox.addTarget(self, action: #selector(checkBoxClicked(_:)), for: .touchUpInside)
        
        view.addSubview(ageCheckBox)
        view.addSubview(serviceCheckBox)
        view.addSubview(privacyCheckBox)
        
        ageCheckBox.translatesAutoresizingMaskIntoConstraints = false
        ageCheckBox.topAnchor.constraint(equalTo: totalAgreeBottomLine.bottomAnchor, constant: 25).isActive = true
        ageCheckBox.leadingAnchor.constraint(equalTo: totalCheckBox.leadingAnchor).isActive = true
        ageCheckBox.widthAnchor.constraint(equalTo: totalCheckBox.widthAnchor).isActive = true
        ageCheckBox.heightAnchor.constraint(equalTo: totalCheckBox.heightAnchor).isActive = true
        
        serviceCheckBox.translatesAutoresizingMaskIntoConstraints = false
        serviceCheckBox.topAnchor.constraint(equalTo: ageCheckBox.bottomAnchor, constant: 60).isActive = true
        serviceCheckBox.leadingAnchor.constraint(equalTo: ageCheckBox.leadingAnchor).isActive = true
        serviceCheckBox.widthAnchor.constraint(equalTo: ageCheckBox.widthAnchor).isActive = true
        serviceCheckBox.heightAnchor.constraint(equalTo: ageCheckBox.heightAnchor).isActive = true
        
        privacyCheckBox.translatesAutoresizingMaskIntoConstraints = false
        privacyCheckBox.topAnchor.constraint(equalTo: serviceCheckBox.bottomAnchor, constant: 60).isActive = true
        privacyCheckBox.leadingAnchor.constraint(equalTo: serviceCheckBox.leadingAnchor).isActive = true
        privacyCheckBox.widthAnchor.constraint(equalTo: serviceCheckBox.widthAnchor).isActive = true
        privacyCheckBox.heightAnchor.constraint(equalTo: serviceCheckBox.heightAnchor).isActive = true
    }
    
    private func configureLabels() {
        let stringValue = "만 14세 이상 (필수)"
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: stringValue)
        attributedString.setColorForText(textForAttribute: "만 14세 이상", withColor: #colorLiteral(red: 0.5646031499, green: 0.5648178458, blue: 0.5603218079, alpha: 1), font: UIFont.systemFont(ofSize: 16, weight: .light))
        attributedString.setColorForText(textForAttribute: "(필수)", withColor: #colorLiteral(red: 0.8543364406, green: 0, blue: 0.3139223754, alpha: 1), font: UIFont.systemFont(ofSize: 16, weight: .semibold))
        ageAgreeLabel.attributedText = attributedString
        view.addSubview(ageAgreeLabel)
        
        ageAgreeLabel.translatesAutoresizingMaskIntoConstraints = false
        ageAgreeLabel.centerYAnchor.constraint(equalTo: ageCheckBox.centerYAnchor).isActive = true
        ageAgreeLabel.leadingAnchor.constraint(equalTo: ageCheckBox.trailingAnchor, constant: 10).isActive = true
        ageAgreeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45).isActive = true
        ageAgreeLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }

    @objc private func dismissButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func totalCheckBoxClicked(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        let checkboxButtonArray = [ageCheckBox, serviceCheckBox, privacyCheckBox]
        
        if sender.isSelected {
            checkboxButtonArray.forEach {
                $0.isSelected = true
            }
        } else {
            checkboxButtonArray.forEach {
                $0.isSelected = false
            }
        }
    }
    
    @objc private func checkBoxClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }

}

extension NSMutableAttributedString {
    func setColorForText(textForAttribute: String, withColor color: UIColor, font: UIFont) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
}
