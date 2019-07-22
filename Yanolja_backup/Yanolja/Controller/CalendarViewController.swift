//
//  CalendarViewController.swift
//  Yanolja
//
//  Created by brian은석 on 16/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    private let mainView = UIView()
    private let backButton = UIButton()
    private let mainTitleLabel = UILabel()
    private let scrollView = UIScrollView()
    private let removeButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.2)

        topUI()
    }
    private func topUI() {
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: view.frame.height/8).isActive = true
        mainView.isUserInteractionEnabled = true
        //코너 라디우스 위만 주기.
        mainView.layer.cornerRadius = 20
        mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        mainView.backgroundColor = .white
        
        mainView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: mainView.topAnchor,constant: UISetting.basicPadding.rawValue).isActive = true
        backButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: UISetting.leadingTrailingPadding.rawValue).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.setImage(UIImage(named: "dismiss"), for: .normal)
        
        
        backButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        
        
        
        mainView.addSubview(mainTitleLabel)
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainTitleLabel.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 20).isActive = true
        
        mainTitleLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor,constant: 10).isActive = true
        mainTitleLabel.text = "키워드 검색"
        mainTitleLabel.font = UIFont.boldSystemFont(ofSize: 23)
     
        mainView.addSubview(removeButton)
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 20).isActive = true
        
        removeButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -UISetting.leadingTrailingPadding.rawValue).isActive = true
        removeButton.setTitle("초기화", for: .normal)
    }
    
    @objc private func dismissAction() {
        dismiss(animated: true, completion: nil) }

    
    
}
