//
//  LoginViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 23/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    // navigationView
    private let navigationView = UIView()
    private let dismissButton = UIButton(type: .custom)
    private let loginTitleLabel = UILabel()
    
    // menuBar
    private let loginMenuBar = LoginMenuBar()
    
    // collectionView
    private let loginViewCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        
        return collectionView
    }()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureNavigationView()
        configureNavigationViewConstraints()
        configureLoginMenuBar()
        configureLoginViewCollectionView()
        configureLoginViewCollectionViewConstraints()
        hideKeyboard()
    }
    
    // MARK: - Configuration
    
    // navigationView
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
    
    // menuBar
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
    
    // collectionView
    private func configureLoginViewCollectionView() {
        loginViewCollectionView.dataSource = self
        loginViewCollectionView.delegate = self
        
        loginViewCollectionView.register(LoginCollectionViewCell.self, forCellWithReuseIdentifier: LoginCollectionViewCell.identifier)
        loginViewCollectionView.register(LoginEasyCollectionViewCell.self, forCellWithReuseIdentifier: LoginEasyCollectionViewCell.identifier)
        
        view.addSubview(loginViewCollectionView)
        
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
    
    // MARK: - Action Method
    @objc private func dismissButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - CollectionView DataSource
extension LoginViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
        case 0:
            
            let cell = loginViewCollectionView.dequeueReusableCell(withReuseIdentifier: LoginCollectionViewCell.identifier, for: indexPath) as! LoginCollectionViewCell
            
            cell.registerButtonAction = {
                if cell.registerButton.isTouchInside {
                    let registerViewController = RegisterViewController()
                    self.present(registerViewController, animated: true, completion: nil)
                }
            }
            
            return cell
            
        case 1:
            
            let cell = loginViewCollectionView.dequeueReusableCell(withReuseIdentifier: LoginEasyCollectionViewCell.identifier, for: indexPath) as! LoginEasyCollectionViewCell
            
            return cell
            
        default:
            
            return UICollectionViewCell()
        }
    }
}

// MARK: - CollectionView Delegate
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

// MARK: - CollectionView Delegate FlowLayout
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

// MARK: - MenuBar Delegate
extension LoginViewController: LoginMenuBarDelegate {
    func loginMenuBarDidSelected(_ indexPath: IndexPath) {
        
        loginViewCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
}

// MARK: - Hide Keyboard Extension
extension LoginViewController {
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
