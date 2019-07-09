//
//  HomeTopButtonTableViewCell.swift
//  Yanolja
//
//  Created by Chunsu Kim on 08/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomeTopButtonTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "HomeTopButtonTableViewCell"
    
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
    
    private let orderofCouponButton = UIButton(type: .custom)
    private let infiniteCouponButton = UIButton(type: .custom)
    private let specialCouponButton = UIButton(type: .custom)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureButtonView()
        configureButtonConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Configuration Views
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
        
        orderofCouponButton.setImage(#imageLiteral(resourceName: "orderof"), for: .normal)
        orderofCouponButton.contentMode = .scaleAspectFit
        infiniteCouponButton.setImage(#imageLiteral(resourceName: "infinite"), for: .normal)
        infiniteCouponButton.contentMode = .scaleAspectFit
        specialCouponButton.setImage(#imageLiteral(resourceName: "spacial"), for: .normal)
        specialCouponButton.contentMode = .scaleAspectFit
        
        contentView.addSubview(buttonView)
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
        buttonView.addSubview(orderofCouponButton)
        buttonView.addSubview(infiniteCouponButton)
        buttonView.addSubview(specialCouponButton)
    }
    
    // MARK: - Configuration Constraints
    private func configureButtonConstraints() {
        
        // ButtonView Constraints
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        buttonView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        buttonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
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
        
        orderofCouponButton.translatesAutoresizingMaskIntoConstraints = false
        orderofCouponButton.topAnchor.constraint(equalTo: centerButtonBackView.bottomAnchor, constant: 3).isActive = true
        orderofCouponButton.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 20).isActive = true
        orderofCouponButton.widthAnchor.constraint(equalTo: centerButtonBackView.widthAnchor, multiplier: 0.33).isActive = true
        orderofCouponButton.heightAnchor.constraint(equalTo: buttonView.heightAnchor, multiplier: 0.36).isActive = true
        
        infiniteCouponButton.translatesAutoresizingMaskIntoConstraints = false
        infiniteCouponButton.centerYAnchor.constraint(equalTo: orderofCouponButton.centerYAnchor).isActive = true
        infiniteCouponButton.centerXAnchor.constraint(equalTo: centerButtonBackView.centerXAnchor).isActive = true
        infiniteCouponButton.widthAnchor.constraint(equalTo: orderofCouponButton.widthAnchor).isActive = true
        infiniteCouponButton.heightAnchor.constraint(equalTo: orderofCouponButton.heightAnchor).isActive = true
        
        specialCouponButton.translatesAutoresizingMaskIntoConstraints = false
        specialCouponButton.centerYAnchor.constraint(equalTo: orderofCouponButton.centerYAnchor).isActive = true
        specialCouponButton.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: -20).isActive = true
        specialCouponButton.widthAnchor.constraint(equalTo: orderofCouponButton.widthAnchor).isActive = true
        specialCouponButton.heightAnchor.constraint(equalTo: orderofCouponButton.heightAnchor).isActive = true
        
        
        
    }

}
