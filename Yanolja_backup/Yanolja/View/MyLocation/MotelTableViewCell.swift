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
    static let identifier = "MotelTableViewCell"
    
    private let wrapMotel: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
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
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        // TODO - 소수점 3자리 필요
        label.text = "694"
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    private let bossComment: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        // TODO: 소수점 3자리 필요
        label.text = "614"
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    private let hotelLocation: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "선릉역 10번출구 도보5분﹒708m"
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13)
        
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
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    private let rentableRoomSubTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "최대 N시간"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
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
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "30,000원")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        
        label.attributedText = attributeString
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        return label
    }()
    
    private let rentableRoomPercent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "16%~"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)
        
        return label
    }()
    
    private let rentableRoomPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25,000"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
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
        label.text = "숙박"
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    private let stayRoomSubTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1N:00 ~"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        return label
    }()
    
    private let stayRoomCancelPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "60,000원")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        
        label.attributedText = attributeString
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        return label
    }()
    
    private let stayRoomPercent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "16%~"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)
        
        return label
    }()
    
    private let stayRoomPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "50,000"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()
    
    private let stayRoomWon: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "원"
        
        return label
    }()
    
    private let divideLine: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        return label
    }()
    
    private let eventTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "EVENT"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        
        return label
    }()
    
    private let eventCont: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "대실/숙박 1만원 쿠폰 + 스타일러, 안마의자, 세탁기aaaaaaa"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 2
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        wrapMotel.layer.borderWidth = 1
        wrapMotel.layer.cornerRadius = 10
        wrapMotel.layer.borderColor = #colorLiteral(red: 0.9122421116, green: 0.9154485914, blue: 0.9250680308, alpha: 1)
        wrapMotel.layer.masksToBounds = true
        
        wrapMotel.backgroundColor = .white
        
//        self.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        
//        self.layer.shadowOpacity = 0.18
//        self.layer.shadowOffset = CGSize(width: 0, height: 2)
//        self.layer.shadowRadius = 2
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.masksToBounds = false
        
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
        hotelCellArea.addSubview(rentableRoomView)
        hotelCellArea.addSubview(stayRoomView)
        rentableRoomView.addSubview(rentableRoomTitle)
        rentableRoomView.addSubview(rentableRoomSubTitle)
        rentableRoomView.addSubview(rentableRoomCancelPrice)
        rentableRoomView.addSubview(rentableRoomPercent)
        rentableRoomView.addSubview(rentableRoomPrice)
        rentableRoomView.addSubview(rentableRoomWon)
        stayRoomView.addSubview(stayRoomTitle)
        stayRoomView.addSubview(stayRoomSubTitle)
        rentableRoomView.addSubview(stayRoomCancelPrice)
        rentableRoomView.addSubview(stayRoomPercent)
        rentableRoomView.addSubview(stayRoomPrice)
        rentableRoomView.addSubview(stayRoomWon)
        hotelCellArea.addSubview(divideLine)
        hotelCellArea.addSubview(eventTitle)
        hotelCellArea.addSubview(eventCont)
        
    }
    
    private func configureAutoLayout() {
        NSLayoutConstraint.activate([
            wrapMotel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            wrapMotel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            wrapMotel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            wrapMotel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            hotelImage.topAnchor.constraint(equalTo: wrapMotel.topAnchor),
            hotelImage.leadingAnchor.constraint(equalTo: wrapMotel.leadingAnchor),
            hotelImage.trailingAnchor.constraint(equalTo: wrapMotel.trailingAnchor),
            hotelImage.bottomAnchor.constraint(equalTo: hotelCellArea.topAnchor, constant: -20),
            hotelImage.heightAnchor.constraint(equalToConstant: 230),
            hotelCellArea.leadingAnchor.constraint(equalTo: wrapMotel.leadingAnchor, constant: 10),
            hotelCellArea.trailingAnchor.constraint(equalTo: wrapMotel.trailingAnchor, constant: -10),
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
            
            rentableRoomView.topAnchor.constraint(equalTo: hotelLocation.bottomAnchor, constant: 40),
            rentableRoomView.leadingAnchor.constraint(equalTo: hotelCellArea.leadingAnchor),
            rentableRoomView.bottomAnchor.constraint(equalTo: divideLine.bottomAnchor, constant: -20),
            rentableRoomView.widthAnchor.constraint(equalTo: hotelCellArea.widthAnchor, multiplier: 0.5),
            rentableRoomTitle.topAnchor.constraint(equalTo: rentableRoomView.topAnchor),
            rentableRoomTitle.leadingAnchor.constraint(equalTo: rentableRoomView.leadingAnchor),
            rentableRoomSubTitle.leadingAnchor.constraint(equalTo: rentableRoomTitle.trailingAnchor, constant: 5),
            rentableRoomSubTitle.bottomAnchor.constraint(equalTo: rentableRoomTitle.bottomAnchor),
            rentableRoomCancelPrice.leadingAnchor.constraint(equalTo: rentableRoomTitle.leadingAnchor),
            rentableRoomCancelPrice.topAnchor.constraint(equalTo: rentableRoomTitle.bottomAnchor, constant: 5),
            rentableRoomPercent.leadingAnchor.constraint(equalTo: rentableRoomView.leadingAnchor),
            rentableRoomPercent.bottomAnchor.constraint(equalTo: rentableRoomView.bottomAnchor),
            rentableRoomPrice.bottomAnchor.constraint(equalTo: rentableRoomPercent.bottomAnchor),
            rentableRoomPrice.leadingAnchor.constraint(equalTo: rentableRoomPercent.trailingAnchor, constant: 5),
            rentableRoomWon.bottomAnchor.constraint(equalTo: rentableRoomPercent.bottomAnchor),
            rentableRoomWon.leadingAnchor.constraint(equalTo: rentableRoomPrice.trailingAnchor),
            
            stayRoomView.leadingAnchor.constraint(equalTo: rentableRoomView.trailingAnchor, constant: 20),
            stayRoomView.topAnchor.constraint(equalTo: rentableRoomView.topAnchor),
            stayRoomView.bottomAnchor.constraint(equalTo: divideLine.bottomAnchor, constant: -20),
            stayRoomView.widthAnchor.constraint(equalTo: hotelCellArea.widthAnchor, multiplier: 0.5),
            stayRoomTitle.topAnchor.constraint(equalTo: stayRoomView.topAnchor),
            stayRoomTitle.leadingAnchor.constraint(equalTo: stayRoomView.leadingAnchor),
            stayRoomSubTitle.leadingAnchor.constraint(equalTo: stayRoomTitle.trailingAnchor, constant: 5),
            stayRoomSubTitle.bottomAnchor.constraint(equalTo: stayRoomTitle.bottomAnchor),
            stayRoomCancelPrice.leadingAnchor.constraint(equalTo: stayRoomTitle.leadingAnchor),
            stayRoomCancelPrice.topAnchor.constraint(equalTo: stayRoomTitle.bottomAnchor, constant: 5),
            stayRoomPercent.leadingAnchor.constraint(equalTo: stayRoomView.leadingAnchor),
            stayRoomPercent.bottomAnchor.constraint(equalTo: stayRoomView.bottomAnchor),
            stayRoomPrice.bottomAnchor.constraint(equalTo: stayRoomPercent.bottomAnchor),
            stayRoomPrice.leadingAnchor.constraint(equalTo: stayRoomPercent.trailingAnchor, constant: 5),
            stayRoomWon.bottomAnchor.constraint(equalTo: stayRoomPercent.bottomAnchor),
            stayRoomWon.leadingAnchor.constraint(equalTo: rentableRoomPrice.trailingAnchor),

            divideLine.widthAnchor.constraint(equalTo: hotelCellArea.widthAnchor),
            divideLine.heightAnchor.constraint(equalToConstant: 1),
            divideLine.leadingAnchor.constraint(equalTo: hotelCellArea.leadingAnchor),
            divideLine.bottomAnchor.constraint(equalTo: eventTitle.topAnchor, constant: -10),
            
            eventTitle.leadingAnchor.constraint(equalTo: hotelCellArea.leadingAnchor),
            eventTitle.bottomAnchor.constraint(equalTo: eventCont.bottomAnchor),
            eventTitle.widthAnchor.constraint(equalToConstant: 50),
            eventCont.topAnchor.constraint(equalTo: eventTitle.topAnchor),
            eventCont.leadingAnchor.constraint(equalTo: eventTitle.trailingAnchor, constant: 10),
            eventCont.bottomAnchor.constraint(equalTo: hotelCellArea.bottomAnchor, constant: -10),
            eventCont.trailingAnchor.constraint(equalTo: hotelCellArea.trailingAnchor),
        ])
        
        switch rentableRoomCancelPrice.text!.count > 0 {
        case true:
            rentableRoomPercent.topAnchor.constraint(equalTo: rentableRoomCancelPrice.bottomAnchor, constant: 5).isActive = true
        case false:
            print("false")
        }
    }
}
