//
//  RegisterViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 27/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    private let dismissButton = UIButton()
    private let nextButton = UIButton()
    
    private let totalCheckBox = UIButton(type: .custom)
    private let ageCheckBox = UIButton(type: .custom)
    private let serviceCheckBox = UIButton(type: .custom)
    private let privacyCheckBox = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        configureNextButton()
        configureCheckBox()
    }
    
    private func configureNextButton() {
        dismissButton.setImage(#imageLiteral(resourceName: "dismisslog"), for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissButtonDidTap(_:)), for: .touchUpInside)
        
        nextButton.setTitle("다음", for: .normal)
        nextButton.backgroundColor = .lightGray
        nextButton.layer.cornerRadius = 5
        
        view.addSubview(dismissButton)
        view.addSubview(nextButton)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        dismissButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    private func configureCheckBox() {
        totalCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
        totalCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        totalCheckBox.addTarget(self, action: #selector(totalCheckBoxClicked(_:)), for: .touchUpInside)
        
        ageCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
        ageCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        ageCheckBox.addTarget(self, action: #selector(checkBoxClicked(_:)), for: .touchUpInside)
        
        serviceCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
        serviceCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        serviceCheckBox.addTarget(self, action: #selector(checkBoxClicked(_:)), for: .touchUpInside)
        
        privacyCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
        privacyCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        privacyCheckBox.addTarget(self, action: #selector(checkBoxClicked(_:)), for: .touchUpInside)
        
        view.addSubview(totalCheckBox)
        view.addSubview(ageCheckBox)
        view.addSubview(serviceCheckBox)
        view.addSubview(privacyCheckBox)
        
        totalCheckBox.translatesAutoresizingMaskIntoConstraints = false
        totalCheckBox.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        totalCheckBox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        totalCheckBox.widthAnchor.constraint(equalToConstant: 25).isActive = true
        totalCheckBox.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        ageCheckBox.translatesAutoresizingMaskIntoConstraints = false
        ageCheckBox.topAnchor.constraint(equalTo: totalCheckBox.bottomAnchor, constant: 60).isActive = true
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
    
    private func checkBoxUnchecked() {
        totalCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
        ageCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
        serviceCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
        privacyCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
    }
    
    private func checkBoxChecked() {
        totalCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        ageCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        serviceCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        privacyCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        
    }

    @objc private func dismissButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func totalCheckBoxClicked(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        if sender.isSelected {
            checkBoxChecked()
        } else {
            checkBoxUnchecked()
        }
    }
    
    @objc private func checkBoxClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }

}
