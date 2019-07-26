//
//  NumberOfPeopleViewController.swift
//  Yanolja
//
//  Created by brian은석 on 24/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class NumberOfPeopleViewController: UIViewController {
    
    let mainView = UIView()
    let backButton = UIButton(type: .system)
    let mainTitleLabel = UILabel()
    let warningLabel = UILabel()
    let warningBoldFontLabel = UILabel()
    let frameView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.2)

        topUI()
    }
    private func topUI() {
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainView.isUserInteractionEnabled = true
        //코너 라디우스 위만 주기.
        mainView.layer.cornerRadius = 20
        mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        mainView.backgroundColor = .white
        
        mainView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: mainView.topAnchor,constant: UISetting.topPadding.rawValue - 3).isActive = true
        backButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 20).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.setImage(UIImage(named: "dismiss"), for: .normal)
        backButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        
        
        
        mainView.addSubview(mainTitleLabel)
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainTitleLabel.lastBaselineAnchor.constraint(equalTo: backButton.lastBaselineAnchor).isActive = true
        mainTitleLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor).isActive = true
        mainTitleLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        mainTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mainTitleLabel.text = "인원수 선택"
        mainTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        
        
        mainView.addSubview(warningLabel)
        warningLabel.translatesAutoresizingMaskIntoConstraints = false
        warningLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 25).isActive = true
        warningLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor).isActive = true
        warningLabel.text = "정확한 숙소검색 결과를 확인하려면"
        warningLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        
        mainView.addSubview(warningBoldFontLabel)
        warningBoldFontLabel.translatesAutoresizingMaskIntoConstraints = false
        warningBoldFontLabel.topAnchor.constraint(equalTo: warningLabel.bottomAnchor).isActive = true
        warningBoldFontLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor).isActive = true
        warningBoldFontLabel.text = "인원수를 선택해 주세요."
        warningBoldFontLabel.font = UIFont.boldSystemFont(ofSize: 13)
        
        mainView.addSubview(frameView)
        frameView.translatesAutoresizingMaskIntoConstraints = false
        frameView.topAnchor.constraint(equalTo: warningBoldFontLabel.bottomAnchor,constant: 13).isActive = true
        frameView.leadingAnchor.constraint(equalTo: backButton.leadingAnchor).isActive = true
        frameView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -20).isActive = true
//        frameView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        frameView.backgroundColor = .yellow
        
        let adultLabel = UILabel()
        mainView.addSubview(adultLabel)
        adultLabel.translatesAutoresizingMaskIntoConstraints = false
        adultLabel.topAnchor.constraint(equalTo: frameView.topAnchor,constant: 15).isActive = true
        adultLabel.leadingAnchor.constraint(equalTo: frameView.leadingAnchor,constant: 15).isActive = true
        adultLabel.text = "성인"
        adultLabel.font = UIFont.systemFont(ofSize: 14)
        
        let plusButton = UIButton(type: .system)
        mainView.addSubview(plusButton)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
       plusButton.contentHorizontalAlignment
        plusButton.topAnchor.constraint(equalTo: frameView.topAnchor,constant: 15).isActive = true
        plusButton.trailingAnchor.constraint(equalTo: frameView.trailingAnchor,constant: -15).isActive = true
        plusButton.backgroundColor = .red
        
        
        let childLabel = UILabel()
        mainView.addSubview(childLabel)
        childLabel.translatesAutoresizingMaskIntoConstraints = false
        childLabel.topAnchor.constraint(equalTo: adultLabel.bottomAnchor,constant: 30).isActive = true
        childLabel.leadingAnchor.constraint(equalTo: frameView.leadingAnchor,constant: 15).isActive = true
        childLabel.bottomAnchor.constraint(equalTo: frameView.bottomAnchor,constant: -15).isActive = true
        childLabel.text = "아동"
        childLabel.font = UIFont.systemFont(ofSize: 14)
        
        

    }
    @objc private func dismissAction() {
        dismiss(animated: true, completion: nil) }

    func a() {
    print(1)
    }
}
