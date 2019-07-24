//
//  LoginViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 23/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let navigationView = UIView()
    private let dismissButton = UIButton(type: .custom)
    private let loginTitleLabel = UILabel()
    private let loginMenuBar = LoginMenuBar()
    
    private let loginViewCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        configureNavigationView()
        configureNavigationViewConstraints()
        configureLoginMenuBar()
        configureLoginViewCollectionView()
        configureLoginViewCollectionViewConstraints()
    }
    
    private func configureNavigationView() {
        navigationView.backgroundColor = .white
        
        dismissButton.setImage(#imageLiteral(resourceName: "dismisslog"), for: .normal)
        dismissButton.contentMode = .scaleAspectFit
        dismissButton.addTarget(self, action: #selector(dismissButtonDidTap(_:)), for: .touchUpInside)
        
        loginTitleLabel.text = "로그인"
        loginTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        loginTitleLabel.textColor = .black
        loginTitleLabel.textAlignment = .center
        
        view.addSubview(navigationView)
        navigationView.addSubview(dismissButton)
        navigationView.addSubview(loginTitleLabel)
    }
    
    private func configureLoginMenuBar() {
        loginMenuBar.delegate = self
        loginMenuBar.loginMenuCollectionView.register(LoginMenuCollectionViewCell.self, forCellWithReuseIdentifier: LoginMenuCollectionViewCell.identifier)
        
        view.addSubview(loginMenuBar)
        loginMenuBar.translatesAutoresizingMaskIntoConstraints = false
        loginMenuBar.topAnchor.constraint(equalTo: navigationView.bottomAnchor).isActive = true
        loginMenuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loginMenuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        loginMenuBar.heightAnchor.constraint(equalTo: navigationView.heightAnchor, multiplier: 0.37).isActive = true
        
    }
    
    private func configureLoginViewCollectionView() {
        loginViewCollectionView.dataSource = self
        loginViewCollectionView.delegate = self
        
        loginViewCollectionView.register(LoginCollectionViewCell.self, forCellWithReuseIdentifier: LoginCollectionViewCell.identifier)
        loginViewCollectionView.register(LoginEasyCollectionViewCell.self, forCellWithReuseIdentifier: LoginEasyCollectionViewCell.identifier)
        
        view.addSubview(loginViewCollectionView)
        
    }
    
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
        loginTitleLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        loginTitleLabel.heightAnchor.constraint(equalTo: navigationView.heightAnchor).isActive = true
        
        
    }
    
    private func configureLoginViewCollectionViewConstraints() {
        
        loginViewCollectionView.translatesAutoresizingMaskIntoConstraints = false
        loginViewCollectionView.topAnchor.constraint(equalTo: loginMenuBar.bottomAnchor).isActive = true
        loginViewCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loginViewCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        loginViewCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc private func dismissButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension LoginViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
        case 0:
            
            let cell = loginViewCollectionView.dequeueReusableCell(withReuseIdentifier: LoginCollectionViewCell.identifier, for: indexPath) as! LoginCollectionViewCell
            
            return cell
            
        case 1:
            
            let cell = loginViewCollectionView.dequeueReusableCell(withReuseIdentifier: LoginEasyCollectionViewCell.identifier, for: indexPath) as! LoginEasyCollectionViewCell
            
            return cell
            
        default:
            
            return UICollectionViewCell()
        }
    }
}


extension LoginViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / view.frame.width)
        loginMenuBar.calculateIndicatorLeadingAndWidth(index: page)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let itemAt = Int(targetContentOffset.pointee.x / view.frame.width)
        loginMenuBar.loginMenuCollectionView.selectItem(at: IndexPath(item: itemAt, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
}

extension LoginViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height - loginMenuBar.frame.height - navigationView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
}


extension LoginViewController: LoginMenuBarDelegate {
    func loginMenuBarDidSelected(_ indexPath: IndexPath) {
        
        loginViewCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        
        
    }
    
    
}