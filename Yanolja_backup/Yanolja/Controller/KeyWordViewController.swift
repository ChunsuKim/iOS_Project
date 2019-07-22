//
//  KeyWordViewController.swift
//  Yanolja
//
//  Created by brian은석 on 12/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class KeyWordViewController: UIViewController {
    let mainView = UIView()
    var mainViewTopAnchor :NSLayoutConstraint?
    private let dismissButton = UIButton()
    private let mainTitleLabel = UILabel()
    private let searchTextField = UITextField()
    var searchTextTopAnchor :NSLayoutConstraint?
    private let recentlyLabel = UILabel()
    private let removeButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.2)
        
        topUI()
        self.recentlySearchPointUI()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.1, animations: {
            self.searchTextTopAnchor?.constant = 140
            self.mainView.layoutIfNeeded()
        }, completion: { (finished) in
            self.recentlySearchPointUI()
        })
        
    }
    
    private func topUI() {
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        mainView.isUserInteractionEnabled = true
        //코너 라디우스 위만 주기.
        mainView.layer.cornerRadius = 20
        mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        mainView.backgroundColor = .white
        
        mainView.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.topAnchor.constraint(equalTo: mainView.topAnchor,constant: UISetting.basicPadding.rawValue).isActive = true
        dismissButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dismissButton.setImage(UIImage(named: "dismiss"), for: .normal)
        
        
        dismissButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        
        
        
        mainView.addSubview(mainTitleLabel)
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainTitleLabel.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 40).isActive = true
        
        mainTitleLabel.leadingAnchor.constraint(equalTo: dismissButton.trailingAnchor).isActive = true
        
        mainTitleLabel.text = "키워드 검색"
        mainTitleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        
        
        
        mainView.addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextTopAnchor = searchTextField.topAnchor.constraint(equalTo:
            view.topAnchor,constant: view.frame.maxY/4 - view.frame.maxY/81.2)
        searchTextTopAnchor?.isActive = true
        
        searchTextField.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        searchTextField.widthAnchor.constraint(equalToConstant: view.frame.width - (UISetting.leadingTrailingPadding.rawValue * 2)).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue).isActive = true
        searchTextField.layer.masksToBounds = true
        searchTextField.layer.cornerRadius = UISetting.viewHeight.rawValue/2
        searchTextField.placeholder = "지역,지하철,숙소를 찾아보세요."
        let imageView = UIImageView()
        imageView.image = UIImage(named: "spot")
        searchTextField.leftView = imageView
        searchTextField.leftView?.frame = CGRect(x: 20, y: 0, width: 60, height: 60)
        searchTextField.leftViewMode = .always
        searchTextField.backgroundColor = #colorLiteral(red: 0.9759308696, green: 0.9800482392, blue: 0.982830584, alpha: 1)
    }
    @objc private func dismissAction() {
        dismiss(animated: true, completion: nil) }
    
    func recentlySearchPointUI() {
        recentlyLabel.text = "최근 검색 키워드"
        recentlyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        mainView.addSubview(recentlyLabel)
        recentlyLabel.topAnchor.constraint(equalTo:
            view.topAnchor,constant: view.frame.maxY/4 - view.frame.maxY/49.777777777).isActive = true
        recentlyLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        recentlyLabel.heightAnchor.constraint(equalToConstant: UISetting.viewHeight.rawValue/2).isActive = true
        
        mainView.addSubview(removeButton)
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        
        removeButton.firstBaselineAnchor.constraint(equalTo: recentlyLabel.firstBaselineAnchor).isActive = true
        removeButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -UISetting.leadingTrailingPadding.rawValue).isActive = true
        removeButton.setTitle("모두삭제", for: .normal)
        removeButton.addTarget(self, action: #selector(removeAction), for: .touchUpInside)
        //테이블뷰 총 5개까지만 나타남.
        
        
    }
    @objc private func removeAction() {
        
        
    }
    
    
}
