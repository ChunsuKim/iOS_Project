//
//  ReservationCollectionThirdViewCell.swift
//  Yanolja
//
//  Created by brian은석 on 30/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ReservationCollectionThirdViewCell: UICollectionViewCell {
    
    var amount = "246,000"
    
    let finalPaymentAmountTitle = UILabel()
    let finalPaymentAmount = UILabel()
    let topBarView = UIView()
    
    
    let reservedAmountTitle = UILabel()
    let reservedAmount = UILabel()
   
    let couponTitle = UILabel()
    let usableCoupon = UIButton()
  
    let pointTitle = UILabel()
    let pointButton = UIButton()
    let pointBar = UIView()
    
    let kakaoButton = UIButton()
    let imageView = UIImageView()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    private func configure() {
        let tempArr = [finalPaymentAmountTitle,finalPaymentAmount,topBarView,reservedAmountTitle,reservedAmount,couponTitle,usableCoupon,pointTitle,pointButton,pointBar,kakaoButton,imageView]
        tempArr.forEach{self.addSubview($0) ; $0.translatesAutoresizingMaskIntoConstraints = false}

        finalPaymentAmountTitle.topAnchor.constraint(equalTo: self.topAnchor,constant: 30).isActive = true
        finalPaymentAmountTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15).isActive = true
        finalPaymentAmountTitle.text = "최종결제금액"
        finalPaymentAmountTitle.font = UIFont.boldSystemFont(ofSize: 20)
        
        finalPaymentAmount.topAnchor.constraint(equalTo: self.topAnchor,constant: 30).isActive = true
        finalPaymentAmount.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15).isActive = true
        finalPaymentAmount.text = "\(amount)"
        finalPaymentAmount.font = UIFont.boldSystemFont(ofSize: 20)
        
        topBarView.topAnchor.constraint(equalTo: finalPaymentAmountTitle.bottomAnchor,constant: 30).isActive = true
        topBarView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15).isActive = true
        topBarView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15).isActive = true
        topBarView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        topBarView.backgroundColor = #colorLiteral(red: 0.4823141098, green: 0.4823748469, blue: 0.4822933078, alpha: 1)
        
        reservedAmountTitle.topAnchor.constraint(equalTo: topBarView.bottomAnchor,constant: 30).isActive = true
        reservedAmountTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15).isActive = true
        reservedAmountTitle.text = "예약가"
        reservedAmountTitle.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)

        reservedAmount.topAnchor.constraint(equalTo: topBarView.bottomAnchor,constant: 30).isActive = true
        reservedAmount.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15).isActive = true
        reservedAmount.text = "\(amount)"
        reservedAmount.font = UIFont.systemFont(ofSize: 15, weight: .medium)

        

        
        couponTitle.topAnchor.constraint(equalTo: reservedAmountTitle.bottomAnchor,constant: 30).isActive = true
        couponTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15).isActive = true
        couponTitle.text = "쿠폰"
        couponTitle.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        
        
        
        usableCoupon.topAnchor.constraint(equalTo: reservedAmountTitle.bottomAnchor,constant: 30).isActive = true
        usableCoupon.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15).isActive = true
        usableCoupon.setTitle("사용가능 쿠폰 8개", for: .normal)
        usableCoupon.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        usableCoupon.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)

        
        pointTitle.topAnchor.constraint(equalTo: couponTitle.bottomAnchor,constant: 30).isActive = true
        pointTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15).isActive = true
        pointTitle.text = "포인트"
        pointTitle.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        
        pointButton.topAnchor.constraint(equalTo: couponTitle.bottomAnchor,constant: 30).isActive = true
        pointButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15).isActive = true
        pointButton.setTitle("보유 포인트 없음", for: .normal)
        pointButton.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
        pointButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight)
        
        pointBar.topAnchor.constraint(equalTo: pointButton.bottomAnchor,constant: 5).isActive = true
        pointBar.leadingAnchor.constraint(equalTo: pointTitle.trailingAnchor,constant: 30).isActive = true
        pointBar.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15).isActive = true
        pointBar.heightAnchor.constraint(equalToConstant: 1).isActive = true
        pointBar.backgroundColor = #colorLiteral(red: 0.4823141098, green: 0.4823748469, blue: 0.4822933078, alpha: 1)

        
        //
        kakaoButton.topAnchor.constraint(equalTo: pointBar.bottomAnchor,constant: 40).isActive = true
        kakaoButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15).isActive = true
        kakaoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15).isActive = true
        kakaoButton.setImage(UIImage(named: "kakaoButton"), for: .normal)

        //이미지뷰
        
        imageView.topAnchor.constraint(equalTo: kakaoButton.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15).isActive = true
        imageView.image = UIImage(named: "payImage")
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }

}
