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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureNavigationView()
        configureNavigationViewConstraints()
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
        
        view.addSubview(navigationView)
        navigationView.addSubview(dismissButton)
        navigationView.addSubview(loginTitleLabel)
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
        
        
    }
    
    // MARK: - Action Method
    @objc private func dismissButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
