//
//  HomeThemeButton.swift
//  Yanolja
//
//  Created by Chunsu Kim on 16/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomeThemeDiffButton: UIView {

    // MARK: - Properties
    
    let currentPageNumberLabel = UILabel()
    let totalPageNumberLabel = UILabel()
    
    private let refleshImageView = UIImageView()
    private let refleshLabel = UILabel()
    private let dashPageNumberLabel = UILabel()
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
    
    // MARK: - Configuration
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
        currentPageNumberLabel.text = ""
        currentPageNumberLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        dashPageNumberLabel.text = " /"
        dashPageNumberLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        totalPageNumberLabel.text = ""
        totalPageNumberLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        
        addSubview(themeButtonViewTopLine)
        addSubview(themeButtonViewBottomLine)
        addSubview(themeButtonStackView)
        themeButtonStackView.addArrangedSubview(refleshImageView)
        themeButtonStackView.addArrangedSubview(refleshLabel)
        themeButtonStackView.addArrangedSubview(currentPageNumberLabel)
        themeButtonStackView.addArrangedSubview(dashPageNumberLabel)
        themeButtonStackView.addArrangedSubview(totalPageNumberLabel)
    }
    
    // MARK: - configuration Constraints
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
        themeButtonStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        themeButtonStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        refleshImageView.translatesAutoresizingMaskIntoConstraints = false
        refleshImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        refleshImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        refleshLabel.translatesAutoresizingMaskIntoConstraints = false
        refleshLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        refleshLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        currentPageNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        currentPageNumberLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        currentPageNumberLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        dashPageNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        dashPageNumberLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        dashPageNumberLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        totalPageNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        totalPageNumberLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        totalPageNumberLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
}
