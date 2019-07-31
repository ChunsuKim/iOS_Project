//
//  StayRoomTableView.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/26.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class StayRoomListTableViewCell: UITableViewCell {

    // MARK: - Properties
    let stayTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "선릉 호텔 발리"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        
        return label
    }()
    
    let stayGradeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "star")
        
        return imageView
    }()
    
    let stayGradeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4.5"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    let reviewTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "후기"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        
        return label
    }()
    
    let reviewCont: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(707)"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    let bossReviewTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "사장님 댓글"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        
        return label
    }()
    
    let bossReviewCont: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(707)"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    let stayEventInfo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "최저가보상제"
        label.textColor = #colorLiteral(red: 0.3803921569, green: 0.3803921569, blue: 0.3803921569, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
    }()
    
    let locationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        var image = #imageLiteral(resourceName: "regiond").withRenderingMode(.alwaysTemplate)
        imageView.tintColor = #colorLiteral(red: 0.1411764706, green: 0.4823529412, blue: 0.6235294118, alpha: 1)
        imageView.image = image
        
        return imageView
    }()
    
    let locationCont: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2호선 역삼역 인근"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 0.1411764706, green: 0.4823529412, blue: 0.6235294118, alpha: 1)
        
        return label
    }()
    
    let callIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        var image = #imageLiteral(resourceName: "call").withRenderingMode(.alwaysTemplate)
        imageView.tintColor = #colorLiteral(red: 0.1411764706, green: 0.4823529412, blue: 0.6235294118, alpha: 1)
        imageView.image = image
        
        return imageView
    }()
    
    let callCont: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "전화하기"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 0.1411764706, green: 0.4823529412, blue: 0.6235294118, alpha: 1)
        
        return label
    }()
    
    let couponButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "detailCouponImage"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        
        return button
    }()
    
    let couponButton2: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "motelCoupon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        
        return button
    }()
    
    let checkInOutView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let checkInView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let checkInTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "체크인"
        label.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    let checkInDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "7월 26일(금)"
        label.textColor = #colorLiteral(red: 0, green: 0.4470588235, blue: 0.6980392157, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        return label
    }()
    
    let checkOutView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let checkOutTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "체크아웃"
        label.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    let checkOutDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "7월 26일(금)"
        label.textColor = #colorLiteral(red: 0, green: 0.4470588235, blue: 0.6980392157, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        return label
    }()
    
    // MARK: - View LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        configureStayInfo()
        configureConstraints()
    }
    
    // MARK: - Configure stayInfo
    private func configureStayInfo() {
        contentView.addSubview(stayTitle)
        contentView.addSubview(stayGradeIcon)
        contentView.addSubview(stayGradeLabel)
        contentView.addSubview(reviewTitle)
        contentView.addSubview(reviewCont)
        contentView.addSubview(bossReviewTitle)
        contentView.addSubview(bossReviewCont)
        contentView.addSubview(stayEventInfo)
        contentView.addSubview(locationIcon)
        contentView.addSubview(locationCont)
        contentView.addSubview(callIcon)
        contentView.addSubview(callCont)
        contentView.addSubview(couponButton)
        contentView.addSubview(couponButton2)
        contentView.addSubview(checkInOutView)
        
        checkInOutView.addSubview(checkInView)
        checkInView.addSubview(checkInTitle)
        checkInView.addSubview(checkInDate)
        checkInOutView.addSubview(checkOutView)
        checkOutView.addSubview(checkOutTitle)
        checkOutView.addSubview(checkOutDate)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            stayTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stayTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stayTitle.bottomAnchor.constraint(equalTo: stayGradeIcon.topAnchor, constant: -20),
            stayTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stayGradeIcon.leadingAnchor.constraint(equalTo: stayTitle.leadingAnchor),
            stayGradeIcon.widthAnchor.constraint(equalToConstant: 23),
            stayGradeIcon.heightAnchor.constraint(equalToConstant: 23),
            stayGradeIcon.trailingAnchor.constraint(equalTo: stayGradeLabel.leadingAnchor, constant: -5),
            stayGradeIcon.bottomAnchor.constraint(equalTo: stayEventInfo.topAnchor, constant: -10),
            stayGradeLabel.bottomAnchor.constraint(equalTo: stayGradeIcon.bottomAnchor),
            stayGradeLabel.trailingAnchor.constraint(equalTo: reviewTitle.leadingAnchor, constant: -20),
            reviewTitle.bottomAnchor.constraint(equalTo: stayGradeIcon.bottomAnchor),
            reviewTitle.trailingAnchor.constraint(equalTo: reviewCont.leadingAnchor, constant: -5),
            reviewCont.bottomAnchor.constraint(equalTo: stayGradeIcon.bottomAnchor),
            reviewCont.trailingAnchor.constraint(equalTo: bossReviewTitle.leadingAnchor, constant: -20),
            bossReviewTitle.bottomAnchor.constraint(equalTo: stayGradeIcon.bottomAnchor),
            bossReviewTitle.trailingAnchor.constraint(equalTo: bossReviewCont.leadingAnchor, constant: -5),
            bossReviewCont.bottomAnchor.constraint(equalTo: stayGradeIcon.bottomAnchor),
            
            stayEventInfo.leadingAnchor.constraint(equalTo: stayTitle.leadingAnchor),
            stayEventInfo.bottomAnchor.constraint(equalTo: locationIcon.topAnchor),
            locationIcon.leadingAnchor.constraint(equalTo: stayTitle.leadingAnchor),
            locationIcon.trailingAnchor.constraint(equalTo: locationCont.leadingAnchor, constant: -5),
            locationIcon.bottomAnchor.constraint(equalTo: couponButton.topAnchor, constant: -20),
            locationIcon.widthAnchor.constraint(equalToConstant: 20),
            locationIcon.heightAnchor.constraint(equalToConstant: 20),
            locationCont.bottomAnchor.constraint(equalTo: locationIcon.bottomAnchor),
            locationCont.trailingAnchor.constraint(equalTo: callIcon.leadingAnchor, constant: -5),
            callIcon.bottomAnchor.constraint(equalTo: locationIcon.bottomAnchor),
            callIcon.widthAnchor.constraint(equalToConstant: 20),
            callIcon.heightAnchor.constraint(equalToConstant: 20),
            callIcon.trailingAnchor.constraint(equalTo: callCont.leadingAnchor, constant: -5),
            callCont.bottomAnchor.constraint(equalTo: callIcon.bottomAnchor),
//            callCont.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            couponButton.leadingAnchor.constraint(equalTo: locationIcon.leadingAnchor),
            couponButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -40),
            couponButton.bottomAnchor.constraint(equalTo: couponButton2.topAnchor, constant: -20),
            couponButton2.leadingAnchor.constraint(equalTo: locationIcon.leadingAnchor),
            couponButton2.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -40),
            couponButton2.bottomAnchor.constraint(equalTo: checkInOutView.topAnchor, constant: -20),
            
            checkInOutView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            checkInOutView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            checkInOutView.heightAnchor.constraint(equalToConstant: 70),
            checkInOutView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            checkInOutView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -40),
            
            checkInView.topAnchor.constraint(equalTo: checkInOutView.topAnchor),
            checkInView.leadingAnchor.constraint(equalTo: checkInOutView.leadingAnchor),
            checkInView.widthAnchor.constraint(equalTo: checkInOutView.widthAnchor, multiplier: 0.5),
            checkInView.bottomAnchor.constraint(equalTo: checkInOutView.bottomAnchor),
            checkInView.trailingAnchor.constraint(equalTo: checkOutView.leadingAnchor),
            checkInTitle.topAnchor.constraint(equalTo: checkInView.topAnchor, constant: 10),
            checkInTitle.centerXAnchor.constraint(equalTo: checkInView.centerXAnchor),
            checkInTitle.bottomAnchor.constraint(equalTo: checkInDate.topAnchor),
            checkInDate.centerXAnchor.constraint(equalTo: checkInTitle.centerXAnchor),
            checkInDate.bottomAnchor.constraint(equalTo: checkInView.bottomAnchor, constant: -10),
            
            checkOutView.topAnchor.constraint(equalTo: checkInView.topAnchor),
            checkOutView.trailingAnchor.constraint(equalTo: checkInOutView.trailingAnchor),
            checkOutView.bottomAnchor.constraint(equalTo: checkInView.bottomAnchor),
            checkOutView.widthAnchor.constraint(equalTo: checkInView.widthAnchor),
            checkOutTitle.topAnchor.constraint(equalTo: checkOutView.topAnchor, constant: 10),
            checkOutTitle.centerXAnchor.constraint(equalTo: checkOutView.centerXAnchor),
            checkOutTitle.bottomAnchor.constraint(equalTo: checkOutDate.topAnchor),
            checkOutDate.centerXAnchor.constraint(equalTo: checkOutTitle.centerXAnchor),
            checkOutDate.bottomAnchor.constraint(equalTo: checkOutView.bottomAnchor, constant: -10),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
