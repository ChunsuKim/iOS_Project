//
//  ResevationCollectionViewCell.swift
//  Yanolja
//
//  Created by brian은석 on 30/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ReservationCollectionFirstViewCell: UICollectionViewCell {
    
    // MARK: - properties
    // 메인
    let stayTitle = UILabel()
    let roomTitle = UILabel()
    
    // 체크인 체크아웃
    let checkInOutFrame = UIView()
    // 체크인
    let checkIn = UILabel()
    let checkInDate = UILabel()
    let checkInTime = UILabel()
    
    // 화살표
    let pointer = UIImageView()
    
    // 체크아웃
    let checkOut = UILabel()
    let checkOutDate = UILabel()
    let checkOutTime = UILabel()
    let constantOfLeading :CGFloat = 20
    let font :CGFloat = 15
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        fakeData()
    }
    func configure() {
        let tempArr = [stayTitle,roomTitle,checkInOutFrame,checkIn,checkInDate,checkInTime,pointer,checkOut,checkOutDate,checkOutTime]
        tempArr.forEach{self.addSubview($0) ; $0.translatesAutoresizingMaskIntoConstraints = false}
        
        stayTitle.topAnchor.constraint(equalTo: self.topAnchor,constant: 30).isActive = true
        stayTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constantOfLeading).isActive = true
        stayTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -constantOfLeading).isActive = true
        stayTitle.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        roomTitle.topAnchor.constraint(equalTo: stayTitle.bottomAnchor,constant: 3).isActive = true
        roomTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constantOfLeading).isActive = true
        roomTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -constantOfLeading).isActive = true
        roomTitle.heightAnchor.constraint(equalToConstant: 25).isActive = true

        
        checkInOutFrame.topAnchor.constraint(equalTo: roomTitle.bottomAnchor,constant: 30).isActive = true
        checkInOutFrame.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        checkInOutFrame.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        checkInOutFrame.heightAnchor.constraint(equalToConstant: 90).isActive = true
        checkInOutFrame.backgroundColor = #colorLiteral(red: 0.975917995, green: 0.9766693711, blue: 0.9726373553, alpha: 1)
        
        
        checkIn.topAnchor.constraint(equalTo: checkInOutFrame.topAnchor, constant: 10).isActive = true
        checkIn.leadingAnchor.constraint(equalTo: checkInOutFrame.leadingAnchor, constant: 30).isActive = true
        checkIn.text = "체크인"
        checkIn.textColor = #colorLiteral(red: 0.5684219599, green: 0.5688683987, blue: 0.5684910417, alpha: 1)
        checkIn.font = UIFont.systemFont(ofSize: font)
        
        
        checkInDate.topAnchor.constraint(equalTo: checkIn.bottomAnchor, constant: 3).isActive = true
        checkInDate.leadingAnchor.constraint(equalTo: checkInOutFrame.leadingAnchor, constant: 30).isActive = true
        checkInDate.font = UIFont.systemFont(ofSize: font)
        
        
        checkInTime.topAnchor.constraint(equalTo: checkInDate.bottomAnchor, constant: 3).isActive = true
        checkInTime.leadingAnchor.constraint(equalTo: checkInOutFrame.leadingAnchor, constant: 30).isActive = true
        checkInTime.font = UIFont.boldSystemFont(ofSize: 25)
        
        pointer.centerXAnchor.constraint(equalTo: checkInOutFrame.centerXAnchor,constant: -5).isActive = true
        pointer.centerYAnchor.constraint(equalTo: checkInOutFrame.centerYAnchor).isActive = true
        pointer.image = UIImage(named: "pointer")
        
        checkOut.topAnchor.constraint(equalTo: checkInOutFrame.topAnchor, constant: 10).isActive = true
        checkOut.leadingAnchor.constraint(equalTo: pointer.trailingAnchor, constant: 40).isActive = true
        checkOut.text = "체크아웃"
        checkOut.textColor = #colorLiteral(red: 0.5684219599, green: 0.5688683987, blue: 0.5684910417, alpha: 1)
        checkOut.font = UIFont.systemFont(ofSize: font)
        
        
        checkOutDate.topAnchor.constraint(equalTo: checkOut.bottomAnchor, constant: 3).isActive = true
        checkOutDate.leadingAnchor.constraint(equalTo: pointer.trailingAnchor, constant: 40).isActive = true
        checkOutDate.font = UIFont.systemFont(ofSize: font)
        
        
        checkOutTime.topAnchor.constraint(equalTo: checkOutDate.bottomAnchor, constant: 3).isActive = true
        checkOutTime.leadingAnchor.constraint(equalTo: pointer.trailingAnchor, constant: 40).isActive = true
        checkOutTime.font = UIFont.boldSystemFont(ofSize: 25)
        
    }
    
//레이블에 이값 없으면 크기 안잡히는데!!!??
   private func fakeData() {
        stayTitle.text = "건대 호텔 K WORLD"
        stayTitle.font = UIFont.boldSystemFont(ofSize: 32)

        roomTitle.text = "DELUXE DOUBLE"
        roomTitle.font = UIFont.systemFont(ofSize: 20, weight: .regular)

        checkInDate.text = "2019.07.30 (화)"
        checkInTime.text = "20:00"
        checkOutDate.text = "2019.07.30 (화)"
        checkOutTime.text = "22:00"
    

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func stayAndRoomTitleAndInOutTimeSender(stayTitle:String, roomTitle:String ,checkInDate:String,checkInTime:String,checkOutDate:String, checkOutTime:String ) {
        self.stayTitle.text = stayTitle
        self.roomTitle.text = roomTitle
        self.checkInDate.text = checkInDate
        self.checkInTime.text = checkInTime
        self.checkOutDate.text = checkOutDate
        self.checkOutTime.text = checkOutTime

        self.stayTitle.font = UIFont.boldSystemFont(ofSize: 32)
        self.roomTitle.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        self.checkInDate.font = UIFont.systemFont(ofSize: font)
        self.checkInTime.font = UIFont.boldSystemFont(ofSize: 25)
        self.checkOut.font = UIFont.systemFont(ofSize: font)
        self.checkOutTime.font = UIFont.boldSystemFont(ofSize: 25)

        

    }
    
}
