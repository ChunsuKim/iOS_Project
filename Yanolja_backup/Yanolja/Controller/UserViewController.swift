//
//  UserViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 06/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    private let loginOrRegisterButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton()
    }
    
    private func configureButton() {
        loginOrRegisterButton.setTitle("로그인 및 회원가입", for: .normal)
        loginOrRegisterButton.setTitleColor(#colorLiteral(red: 0.9960784314, green: 0.2039215686, blue: 0.4705882353, alpha: 1), for: .normal)
        loginOrRegisterButton.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        
        view.addSubview(loginOrRegisterButton)
        
        loginOrRegisterButton.translatesAutoresizingMaskIntoConstraints = false
        loginOrRegisterButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        loginOrRegisterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loginOrRegisterButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        loginOrRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func buttonDidTap(_ sender: UIButton) {
        let loginViewController = LoginViewController()
        present(loginViewController, animated: true, completion: nil)
    }
    

}
