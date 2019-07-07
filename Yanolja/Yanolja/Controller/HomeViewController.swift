//
//  HomeViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 06/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    // HeaderView
    private let headerView = UIView()
    private let headerImageView = UIImageView()
    private let headerSearchLabel = UILabel()
    private let headerSearchImageView = UIImageView()
    
    private let backgroundScrollView = UIScrollView()
    
    // ButtonView
    private let buttonView = UIView()
    private let couponButton = UIButton(type: .custom)
    private let centerButtonBackView = UIView()
    private let buttonStackView = UIStackView()
    private let motelButton = UIButton(type: .custom)
    private let hotelButton = UIButton(type: .custom)
    private let pensionButton = UIButton(type: .custom)
    private let guestButton = UIButton(type: .custom)
    private let eventButtonStackView = UIStackView()
    private let foreignButton = UIButton(type: .custom)
    private let ticketButton = UIButton(type: .custom)
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        
        configureHeaderView()
        configureButtonView()
        configureConstraints()
        configureCollectionView()
    }
    
    // MARK: - Configuration Views
    private func configureHeaderView() {
        headerView.backgroundColor = #colorLiteral(red: 0.9677450061, green: 0.9726848006, blue: 0.9768208861, alpha: 1)
        
        headerImageView.image = UIImage(named: "logob")
        headerImageView.contentMode = .scaleAspectFit
        
        headerSearchLabel.backgroundColor = .white
        headerSearchLabel.layer.cornerRadius = 17
        headerSearchLabel.clipsToBounds = true
        headerSearchLabel.text = "    어디로 놀러갈까요?"
        headerSearchLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        headerSearchLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        headerSearchImageView.image = UIImage(named: "grasses")
        headerSearchImageView.contentMode = .scaleAspectFill
        
        view.addSubview(headerView)
        headerView.addSubview(headerImageView)
        headerView.addSubview(headerSearchLabel)
        headerSearchLabel.addSubview(headerSearchImageView)
        
    }
    
    private func configureButtonView() {
        buttonView.backgroundColor = #colorLiteral(red: 0.9724641442, green: 0.9726034999, blue: 0.9724336267, alpha: 1)
        
        couponButton.setImage(#imageLiteral(resourceName: "coupon"), for: .normal)
        couponButton.contentMode = .scaleAspectFit
        
        centerButtonBackView.backgroundColor = .white
        centerButtonBackView.clipsToBounds = true
        centerButtonBackView.layer.cornerRadius = 10
        
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fill
        buttonStackView.spacing = 0
        
        eventButtonStackView.axis = .horizontal
        eventButtonStackView.alignment = .fill
        eventButtonStackView.distribution = .fill
        eventButtonStackView.spacing = 0
        
        motelButton.setImage(#imageLiteral(resourceName: "moteld"), for: .normal)
        motelButton.contentMode = .scaleAspectFit
        hotelButton.setImage(#imageLiteral(resourceName: "hoteld"), for: .normal)
        hotelButton.contentMode = .scaleAspectFit
        pensionButton.setImage(#imageLiteral(resourceName: "pensiond"), for: .normal)
        pensionButton.contentMode = .scaleAspectFit
        guestButton.setImage(#imageLiteral(resourceName: "guestd"), for: .normal)
        guestButton.contentMode = .scaleAspectFit
        
        foreignButton.setImage(#imageLiteral(resourceName: "foreign"), for: .normal)
        foreignButton.contentMode = .scaleAspectFit
        ticketButton.setImage(#imageLiteral(resourceName: "ticket"), for: .normal)
        ticketButton.contentMode = .scaleAspectFit
        
        view.addSubview(backgroundScrollView)
        backgroundScrollView.addSubview(buttonView)
        buttonView.addSubview(couponButton)
        buttonView.addSubview(centerButtonBackView)
        centerButtonBackView.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(motelButton)
        buttonStackView.addArrangedSubview(hotelButton)
        buttonStackView.addArrangedSubview(pensionButton)
        buttonStackView.addArrangedSubview(guestButton)
        centerButtonBackView.addSubview(eventButtonStackView)
        eventButtonStackView.addArrangedSubview(foreignButton)
        eventButtonStackView.addArrangedSubview(ticketButton)
        
    }
    
    private func configureCollectionView() {
        
    }
    
    // MARK: - Configuration Constraints
    private func configureConstraints() {
        
        // HeaderView Constraints
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20).isActive = true
        headerImageView.topAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.topAnchor).isActive = true
        headerImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        headerImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        headerSearchLabel.translatesAutoresizingMaskIntoConstraints = false
        headerSearchLabel.leadingAnchor.constraint(equalTo: headerImageView.trailingAnchor, constant: 10).isActive = true
        headerSearchLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20).isActive = true
        headerSearchLabel.centerYAnchor.constraint(equalTo: headerImageView.centerYAnchor).isActive = true
        headerSearchLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        headerSearchImageView.translatesAutoresizingMaskIntoConstraints = false
        headerSearchImageView.heightAnchor.constraint(equalToConstant: 17).isActive = true
        headerSearchImageView.widthAnchor.constraint(equalToConstant: 17).isActive = true
        headerSearchImageView.centerYAnchor.constraint(equalTo: headerSearchLabel.centerYAnchor).isActive = true
        headerSearchImageView.trailingAnchor.constraint(equalTo: headerSearchLabel.trailingAnchor, constant: -10).isActive = true
        
        // ButtonView Constraints
        backgroundScrollView.translatesAutoresizingMaskIntoConstraints = false
        backgroundScrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        backgroundScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.topAnchor.constraint(equalTo: backgroundScrollView.topAnchor).isActive = true
        buttonView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        couponButton.translatesAutoresizingMaskIntoConstraints = false
        couponButton.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 0).isActive = true
        couponButton.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 20).isActive = true
        couponButton.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: -20).isActive = true
        couponButton.heightAnchor.constraint(equalTo: buttonView.heightAnchor, multiplier: 0.13).isActive = true
        
        centerButtonBackView.translatesAutoresizingMaskIntoConstraints = false
        centerButtonBackView.topAnchor.constraint(equalTo: couponButton.bottomAnchor, constant: 10).isActive = true
        centerButtonBackView.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 20).isActive = true
        centerButtonBackView.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: -20).isActive = true
        centerButtonBackView.heightAnchor.constraint(equalTo: buttonView.heightAnchor, multiplier: 0.45).isActive = true
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.topAnchor.constraint(equalTo: centerButtonBackView.topAnchor, constant: 0).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: centerButtonBackView.leadingAnchor, constant: 0).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: centerButtonBackView.trailingAnchor, constant: 0).isActive = true
        buttonStackView.heightAnchor.constraint(equalTo: centerButtonBackView.heightAnchor, multiplier: 0.6).isActive = true
        
        motelButton.translatesAutoresizingMaskIntoConstraints = false
        motelButton.widthAnchor.constraint(equalTo: buttonStackView.widthAnchor, multiplier: 0.25).isActive = true
        
        hotelButton.translatesAutoresizingMaskIntoConstraints = false
        hotelButton.widthAnchor.constraint(equalTo: buttonStackView.widthAnchor, multiplier: 0.25).isActive = true
        
        pensionButton.translatesAutoresizingMaskIntoConstraints = false
        pensionButton.widthAnchor.constraint(equalTo: buttonStackView.widthAnchor, multiplier: 0.25).isActive = true
        
        guestButton.translatesAutoresizingMaskIntoConstraints = false
        guestButton.widthAnchor.constraint(equalTo: buttonStackView.widthAnchor, multiplier: 0.25).isActive = true
        
        eventButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        eventButtonStackView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor).isActive = true
        eventButtonStackView.leadingAnchor.constraint(equalTo: centerButtonBackView.leadingAnchor, constant: 0).isActive = true
        eventButtonStackView.trailingAnchor.constraint(equalTo: centerButtonBackView.trailingAnchor, constant: 0).isActive = true
        eventButtonStackView.heightAnchor.constraint(equalTo: centerButtonBackView.heightAnchor, multiplier: 0.4).isActive = true
        
        foreignButton.translatesAutoresizingMaskIntoConstraints = false
        foreignButton.widthAnchor.constraint(equalTo: eventButtonStackView.widthAnchor, multiplier: 0.5).isActive = true
        
        ticketButton.translatesAutoresizingMaskIntoConstraints = false
        ticketButton.widthAnchor.constraint(equalTo: eventButtonStackView.widthAnchor, multiplier: 0.5).isActive = true
    }
    

    

}
