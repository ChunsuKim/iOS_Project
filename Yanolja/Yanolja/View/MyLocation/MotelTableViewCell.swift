//
//  HotelTableViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/15.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class MotelTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "HomeThemeCollectionViewCell"
    
    private let wrapMotel: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        
        return view
    }()
    
    private let hotelImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "hotelImage")
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let hotelCellArea: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let hotelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "선릉 호텔 발리"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    private let gradeRate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        // TODO: 소수점 1자리 필요
        label.text = "4.5"
        
        return label
    }()
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        // TODO - 소수점 3자리 필요
        label.text = "694"
        
        return label
    }()
    
    private let bossComment: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        // TODO: 소수점 3자리 필요
        label.text = "614"
        
        return label
    }()
    
    private let hotelLocation: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "선릉역 10번출구 도보5분﹒708m"
        
        return label
    }()
    
    private let rentableRoomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let rentableRoomTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "대실"
        
        return label
    }()
    
    private let rentableRoomSubTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "최대 N시간"
        
        return label
    }()
    
    // 기본 대실 가격
    private let rentableRoomPriceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let rentableRoomCancelPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "30,000원"
        
        return label
    }()
    
    private let rentableRoomPercent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "16%~"
        
        return label
    }()
    
    private let rentableRoomPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25,000"
        
        return label
    }()
    
    private let rentableRoomWon: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "원"
        
        return label
    }()
    
    private let stayRoomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let stayRoomTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let stayRoomSubTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1N:00 ~"
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHotelCell()
        configureAutoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHotelCell() {
        self.addSubview(wrapMotel)
        wrapMotel.addSubview(hotelImage)
        wrapMotel.addSubview(hotelCellArea)
        hotelCellArea.addSubview(hotelTitle)
        hotelCellArea.addSubview(gradeRate)
        hotelCellArea.addSubview(commentLabel)
        hotelCellArea.addSubview(bossComment)
        hotelCellArea.addSubview(hotelLocation)
        
//        self.layer.borderWidth = 1
//        self.layer.cornerRadius = 3
//        self.layer.borderColor = UIColor.clear.cgColor
//        self.layer.masksToBounds = false
//        
//        self.layer.shadowOpacity = 0.18
//        self.layer.shadowOffset = CGSize(width: 1, height: 2)
//        self.layer.shadowRadius = 2
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.masksToBounds = false
    }
    
    private func configureAutoLayout() {
        NSLayoutConstraint.activate([
            wrapMotel.topAnchor.constraint(equalTo: self.topAnchor),
            wrapMotel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            wrapMotel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            wrapMotel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            hotelImage.topAnchor.constraint(equalTo: wrapMotel.topAnchor),
            hotelImage.leadingAnchor.constraint(equalTo: wrapMotel.leadingAnchor),
            hotelImage.trailingAnchor.constraint(equalTo: wrapMotel.trailingAnchor),
            hotelImage.bottomAnchor.constraint(equalTo: hotelCellArea.topAnchor, constant: -20),
            hotelImage.heightAnchor.constraint(equalToConstant: 230),
            hotelCellArea.leadingAnchor.constraint(equalTo: wrapMotel.leadingAnchor, constant: 20),
            hotelCellArea.trailingAnchor.constraint(equalTo: wrapMotel.trailingAnchor, constant: -20),
            hotelCellArea.bottomAnchor.constraint(equalTo: wrapMotel.bottomAnchor),
            hotelTitle.topAnchor.constraint(equalTo: hotelCellArea.topAnchor),
            hotelTitle.leadingAnchor.constraint(equalTo: hotelCellArea.leadingAnchor),
            hotelTitle.trailingAnchor.constraint(equalTo: hotelCellArea.trailingAnchor, constant: -20),
            hotelTitle.bottomAnchor.constraint(equalTo: gradeRate.topAnchor),
            gradeRate.leadingAnchor.constraint(equalTo: hotelCellArea.leadingAnchor),
            gradeRate.bottomAnchor.constraint(equalTo: hotelLocation.topAnchor),
            commentLabel.leadingAnchor.constraint(equalTo: gradeRate.trailingAnchor, constant: 10),
            commentLabel.centerYAnchor.constraint(equalTo: gradeRate.centerYAnchor),
            bossComment.leadingAnchor.constraint(equalTo: commentLabel.trailingAnchor, constant: 10),
            bossComment.centerYAnchor.constraint(equalTo: commentLabel.centerYAnchor),
            hotelLocation.leadingAnchor.constraint(equalTo: hotelCellArea.leadingAnchor),
            hotelLocation.bottomAnchor.constraint(equalTo: hotelCellArea.bottomAnchor)
        ])
    }
}
