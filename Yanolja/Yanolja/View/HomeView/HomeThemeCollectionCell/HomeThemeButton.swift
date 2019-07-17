//
//  HomeThemeButton.swift
//  Yanolja
//
//  Created by Chunsu Kim on 16/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomeThemeButton: UIView {

    private let refleshImageView = UIImageView()
    private let refleshLabel = UILabel()
    private let pageNumberLabel = UILabel()
    private let themeButtonStackView = UIStackView()
    private let themeButtonViewTopLine = UIView()
    private let themeButtonViewBottomLine = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureThemeButtonConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        themeButtonViewTopLine.backgroundColor = #colorLiteral(red: 0.934979856, green: 0.9322634339, blue: 0.931660831, alpha: 1)
        themeButtonViewBottomLine.backgroundColor = #colorLiteral(red: 0.934979856, green: 0.9322634339, blue: 0.931660831, alpha: 1)
        
        themeButtonStackView.axis = .horizontal
        themeButtonStackView.distribution = .equalSpacing
        themeButtonStackView.spacing = 5
        
        refleshImageView.image = UIImage(named: "refresh")
        refleshImageView.contentMode = .scaleAspectFit
        refleshLabel.text = "다른 테마 보기"
        refleshLabel.textAlignment = .left
        refleshLabel.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        pageNumberLabel.text = "1 / 2"
        pageNumberLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        addSubview(themeButtonViewTopLine)
        addSubview(themeButtonViewBottomLine)
        addSubview(themeButtonStackView)
        themeButtonStackView.addArrangedSubview(refleshImageView)
        themeButtonStackView.addArrangedSubview(refleshLabel)
        themeButtonStackView.addArrangedSubview(pageNumberLabel)
    }
    
    private func configureThemeButtonConstraints() {
        themeButtonViewTopLine.translatesAutoresizingMaskIntoConstraints = false
        themeButtonViewTopLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        themeButtonViewTopLine.topAnchor.constraint(equalTo: topAnchor).isActive = true
        themeButtonViewTopLine.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        themeButtonViewTopLine.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        themeButtonViewBottomLine.translatesAutoresizingMaskIntoConstraints = false
        themeButtonViewBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        themeButtonViewBottomLine.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        themeButtonViewBottomLine.leadingAnchor.constraint(equalTo: themeButtonViewTopLine.leadingAnchor).isActive = true
        themeButtonViewBottomLine.trailingAnchor.constraint(equalTo: themeButtonViewTopLine.trailingAnchor).isActive = true
        
        themeButtonStackView.translatesAutoresizingMaskIntoConstraints = false
//        themeButtonStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        themeButtonStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        themeButtonStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        themeButtonStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        refleshImageView.translatesAutoresizingMaskIntoConstraints = false
        refleshImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        refleshImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        refleshLabel.translatesAutoresizingMaskIntoConstraints = false
        refleshLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        refleshLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        pageNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        pageNumberLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        pageNumberLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }

}
