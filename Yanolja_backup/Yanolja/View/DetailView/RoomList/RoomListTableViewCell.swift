//
//  RoomListTableViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/30.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class RoomListTableViewCell: UITableViewCell {

    // MARK: - Properties
    let roomImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    let roomRightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let roomTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        
        return label
    }()
    
    let roomPeople: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        
        return label
    }()
    
    let rentableRoomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let rentableRoomTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    let rentableRoomTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        
        return label
    }()
    
    let rentableRoomDefaultPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    let saleTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "판매가"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    let rentableRoomPercent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)
        
        return label
    }()
    
    let rentableRoomPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    let rentableRoomPriceWon: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "원"
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    let stayRoomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let stayRoomTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    let stayRoomTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        
        return label
    }()
    
    let stayRoomDefaultPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    let saleTitle2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "판매가"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    let stayRoomPercent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)
        
        return label
    }()
    
    let stayRoomPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    let stayRoomPriceWon: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "원"
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        configureRoomView()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureRoomView() {
        contentView.addSubview(roomImage)
        contentView.addSubview(roomRightView)
        roomRightView.addSubview(roomTitle)
        roomRightView.addSubview(roomPeople)
        
        roomRightView.addSubview(stayRoomView)
        roomRightView.addSubview(rentableRoomView)
        
        stayRoomView.addSubview(stayRoomTitle)
        stayRoomView.addSubview(stayRoomTimeLabel)
        stayRoomView.addSubview(stayRoomDefaultPrice)
        stayRoomView.addSubview(saleTitle2)
        stayRoomView.addSubview(stayRoomPercent)
        stayRoomView.addSubview(stayRoomPrice)
        stayRoomView.addSubview(stayRoomPriceWon)
        
        rentableRoomView.addSubview(rentableRoomTitle)
        rentableRoomView.addSubview(rentableRoomTimeLabel)
        rentableRoomView.addSubview(rentableRoomDefaultPrice)
        rentableRoomView.addSubview(saleTitle)
        rentableRoomView.addSubview(rentableRoomPercent)
        rentableRoomView.addSubview(rentableRoomPrice)
        rentableRoomView.addSubview(rentableRoomPriceWon)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            roomImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            roomImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            roomImage.trailingAnchor.constraint(equalTo: roomRightView.leadingAnchor, constant: -10),
            roomImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -40),
            roomImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            roomImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.35),
            
            roomRightView.topAnchor.constraint(equalTo: roomImage.topAnchor),
            roomRightView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            roomRightView.bottomAnchor.constraint(equalTo: roomImage.bottomAnchor),
            roomTitle.topAnchor.constraint(equalTo: roomRightView.topAnchor),
            roomTitle.leadingAnchor.constraint(equalTo: roomRightView.leadingAnchor),
            roomTitle.trailingAnchor.constraint(equalTo: roomRightView.trailingAnchor),
            roomTitle.bottomAnchor.constraint(equalTo: roomPeople.topAnchor, constant: -10),
            roomPeople.leadingAnchor.constraint(equalTo: roomRightView.leadingAnchor),
            roomPeople.trailingAnchor.constraint(equalTo: roomRightView.trailingAnchor),
//            roomPeople.bottomAnchor.constraint(equalTo: rentableRoomView.topAnchor, constant: -10),
            
            stayRoomView.bottomAnchor.constraint(equalTo: roomRightView.bottomAnchor),
            stayRoomView.leadingAnchor.constraint(equalTo: roomRightView.leadingAnchor),
            stayRoomView.trailingAnchor.constraint(equalTo: roomRightView.trailingAnchor),
            stayRoomView.topAnchor.constraint(equalTo: rentableRoomView.bottomAnchor, constant: 20),
            stayRoomTitle.topAnchor.constraint(equalTo: stayRoomView.topAnchor),
            stayRoomTitle.leadingAnchor.constraint(equalTo: stayRoomView.leadingAnchor),
            stayRoomTitle.trailingAnchor.constraint(equalTo: stayRoomTimeLabel.leadingAnchor, constant: -5),
            stayRoomTitle.bottomAnchor.constraint(equalTo: stayRoomTimeLabel.bottomAnchor),
            stayRoomTimeLabel.bottomAnchor.constraint(equalTo: stayRoomDefaultPrice.bottomAnchor),
            stayRoomDefaultPrice.trailingAnchor.constraint(equalTo: stayRoomView.trailingAnchor),
            stayRoomDefaultPrice.bottomAnchor.constraint(equalTo: saleTitle2.topAnchor),
            saleTitle2.widthAnchor.constraint(equalTo: stayRoomView.widthAnchor),
            saleTitle2.leadingAnchor.constraint(equalTo: stayRoomView.leadingAnchor),
            saleTitle2.bottomAnchor.constraint(equalTo: stayRoomPrice.topAnchor),
            stayRoomPriceWon.bottomAnchor.constraint(equalTo: stayRoomView.bottomAnchor),
            stayRoomPriceWon.trailingAnchor.constraint(equalTo: stayRoomView.trailingAnchor),
            stayRoomPriceWon.leadingAnchor.constraint(equalTo: stayRoomPrice.trailingAnchor),
            stayRoomPrice.bottomAnchor.constraint(equalTo: stayRoomPriceWon.bottomAnchor),
            stayRoomPrice.leadingAnchor.constraint(equalTo: stayRoomPercent.trailingAnchor),
            stayRoomPercent.bottomAnchor.constraint(equalTo: stayRoomPriceWon.bottomAnchor),
            stayRoomPercent.trailingAnchor.constraint(equalTo: stayRoomPrice.leadingAnchor, constant: -5),
            
            rentableRoomView.leadingAnchor.constraint(equalTo: roomRightView.leadingAnchor),
            rentableRoomView.trailingAnchor.constraint(equalTo: roomRightView.trailingAnchor),
            rentableRoomTitle.topAnchor.constraint(equalTo: rentableRoomView.topAnchor),
            rentableRoomTitle.leadingAnchor.constraint(equalTo: rentableRoomView.leadingAnchor),
            rentableRoomTitle.trailingAnchor.constraint(equalTo: rentableRoomTimeLabel.leadingAnchor, constant: -5),
            rentableRoomTitle.bottomAnchor.constraint(equalTo: rentableRoomTimeLabel.bottomAnchor),
            rentableRoomTimeLabel.bottomAnchor.constraint(equalTo: rentableRoomDefaultPrice.bottomAnchor),
            rentableRoomDefaultPrice.trailingAnchor.constraint(equalTo: rentableRoomView.trailingAnchor),
            rentableRoomDefaultPrice.bottomAnchor.constraint(equalTo: saleTitle.topAnchor),
            saleTitle.widthAnchor.constraint(equalTo: rentableRoomView.widthAnchor),
            saleTitle.leadingAnchor.constraint(equalTo: rentableRoomView.leadingAnchor),
            saleTitle.bottomAnchor.constraint(equalTo: rentableRoomPrice.topAnchor),
            rentableRoomPriceWon.bottomAnchor.constraint(equalTo: rentableRoomView.bottomAnchor),
            rentableRoomPriceWon.trailingAnchor.constraint(equalTo: rentableRoomView.trailingAnchor),
            rentableRoomPriceWon.leadingAnchor.constraint(equalTo: rentableRoomPrice.trailingAnchor),
            rentableRoomPrice.bottomAnchor.constraint(equalTo: rentableRoomPriceWon.bottomAnchor),
            rentableRoomPrice.leadingAnchor.constraint(equalTo: rentableRoomPercent.trailingAnchor),
            rentableRoomPercent.bottomAnchor.constraint(equalTo: rentableRoomPriceWon.bottomAnchor),
            rentableRoomPercent.trailingAnchor.constraint(equalTo: rentableRoomPrice.leadingAnchor, constant: -5),
        ])
    }
    
}
