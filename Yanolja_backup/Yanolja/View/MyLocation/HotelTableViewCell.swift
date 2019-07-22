//
//  HotelTableViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/15.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HotelTableViewCell: UITableViewCell {
    
    let totalWrap: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "hotelImage")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let hotelContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let hotelGrade: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "3성급"
        
        return label
    }()
    
    let hotelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "호텔 페이토 삼성"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 2
        
        return label
    }()
    
    let starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "star")
        
        return imageView
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "4.3"
        
        return label
    }()
    
    let commentImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "comment")
        
        return imageView
    }()
    
    let commentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "92"
        
        return label
    }()
    
    let locationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "regiond")
        
        return imageView
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "삼성역 5번출구 510m﹒108m"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 2
        
        return label
    }()
    
    let reservationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let reservationRentalRoom: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let rentalRoomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "대실"
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    let rentalRoomTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "15:00 ~"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        return label
    }()
    
    let rentalRoomCancelPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "30,000원")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        
        label.attributedText = attributeString
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        return label
    }()
    
    let rentalRoomPercentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "60%~"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)
        
        return label
    }()
    
    let rentalRoomPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25,000원"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    let reservationStayRoom: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let stayRoomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "숙박"
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    let stayRoomTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "15:00 ~"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        return label
    }()
    
    let stayRoomCancelPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "250,000원")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        
        label.attributedText = attributeString
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        return label
    }()
    
    let stayRoomPercentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "60%~"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)
        
        return label
    }()
    
    let stayRoomPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "100,000원"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        self.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        
//        self.backgroundColor = #colorLiteral(red: 0.9677450061, green: 0.9726848006, blue: 0.9768208861, alpha: 1)
//        totalWrap.backgroundColor = .white
//        totalWrap.layer.borderWidth = 1
//        totalWrap.layer.cornerRadius = 10
//        totalWrap.layer.borderColor = #colorLiteral(red: 0.9122421116, green: 0.9154485914, blue: 0.9250680308, alpha: 1)
//        totalWrap.layer.masksToBounds = true
        
        configureDefaultCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureDefaultCell() {
        addSubview(totalWrap)
        totalWrap.addSubview(cellImage)
        totalWrap.addSubview(hotelContentView)
        hotelContentView.addSubview(hotelGrade)
        hotelContentView.addSubview(hotelTitle)
        hotelContentView.addSubview(starImage)
        hotelContentView.addSubview(commentImage)
        hotelContentView.addSubview(ratingLabel)
        hotelContentView.addSubview(commentLabel)
        hotelContentView.addSubview(locationIcon)
        hotelContentView.addSubview(locationLabel)
        hotelContentView.addSubview(reservationView)
        reservationView.addSubview(reservationRentalRoom)
        reservationRentalRoom.addSubview(rentalRoomLabel)
        reservationRentalRoom.addSubview(rentalRoomTimeLabel)
        reservationRentalRoom.addSubview(rentalRoomCancelPrice)
        reservationRentalRoom.addSubview(rentalRoomPercentLabel)
        reservationRentalRoom.addSubview(rentalRoomPrice)
        reservationView.addSubview(reservationStayRoom)
        reservationStayRoom.addSubview(stayRoomLabel)
        reservationStayRoom.addSubview(stayRoomTimeLabel)
        reservationStayRoom.addSubview(stayRoomCancelPrice)
        reservationStayRoom.addSubview(stayRoomPercentLabel)
        reservationStayRoom.addSubview(stayRoomPrice)
        
        configureDefaultCellAutoLayout()
    }
    
    private func configureDefaultCellAutoLayout() {
        NSLayoutConstraint.activate([
            totalWrap.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            totalWrap.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            totalWrap.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            totalWrap.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            cellImage.topAnchor.constraint(equalTo: totalWrap.topAnchor),
            cellImage.leadingAnchor.constraint(equalTo: totalWrap.leadingAnchor, constant: 20),
            cellImage.heightAnchor.constraint(equalTo: hotelContentView.heightAnchor),
            cellImage.bottomAnchor.constraint(equalTo: totalWrap.bottomAnchor),
            cellImage.widthAnchor.constraint(equalTo: totalWrap.widthAnchor, multiplier: 0.35),
            
            hotelContentView.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 10),
            hotelContentView.topAnchor.constraint(equalTo: cellImage.topAnchor),
            hotelContentView.trailingAnchor.constraint(equalTo: totalWrap.trailingAnchor),
            
            hotelContentView.bottomAnchor.constraint(equalTo: totalWrap.bottomAnchor),
            hotelGrade.topAnchor.constraint(equalTo: hotelContentView.topAnchor),
            hotelGrade.leadingAnchor.constraint(equalTo: hotelContentView.leadingAnchor),
            hotelGrade.trailingAnchor.constraint(equalTo: hotelContentView.trailingAnchor),
            hotelGrade.bottomAnchor.constraint(equalTo: hotelTitle.topAnchor),
            hotelTitle.leadingAnchor.constraint(equalTo: hotelContentView.leadingAnchor),
            hotelTitle.trailingAnchor.constraint(equalTo: hotelContentView.trailingAnchor),
            hotelTitle.bottomAnchor.constraint(equalTo: starImage.topAnchor),
            
            starImage.topAnchor.constraint(equalTo: hotelTitle.bottomAnchor),
            starImage.leadingAnchor.constraint(equalTo: hotelContentView.leadingAnchor),
            starImage.widthAnchor.constraint(equalToConstant: 15),
            starImage.heightAnchor.constraint(equalToConstant: 15),
            starImage.bottomAnchor.constraint(equalTo: locationIcon.topAnchor, constant: -5),
            ratingLabel.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 5),
            ratingLabel.centerYAnchor.constraint(equalTo: starImage.centerYAnchor),
            commentImage.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 10),
            commentImage.widthAnchor.constraint(equalToConstant: 15),
            commentImage.heightAnchor.constraint(equalToConstant: 15),
            commentImage.centerYAnchor.constraint(equalTo: ratingLabel.centerYAnchor),
            commentLabel.leadingAnchor.constraint(equalTo: commentImage.trailingAnchor, constant: 5),
            commentLabel.centerYAnchor.constraint(equalTo: commentImage.centerYAnchor),
            
            locationIcon.leadingAnchor.constraint(equalTo: hotelContentView.leadingAnchor),
            locationIcon.trailingAnchor.constraint(equalTo: locationLabel.leadingAnchor),
            locationIcon.widthAnchor.constraint(equalToConstant: 13),
            locationIcon.heightAnchor.constraint(equalToConstant: 13),
            locationLabel.centerYAnchor.constraint(equalTo: locationIcon.centerYAnchor),
            
            reservationView.leadingAnchor.constraint(equalTo: hotelContentView.leadingAnchor),
            reservationView.bottomAnchor.constraint(equalTo: hotelContentView.bottomAnchor),
            reservationView.trailingAnchor.constraint(equalTo: hotelContentView.trailingAnchor),
            reservationView.heightAnchor.constraint(equalTo: hotelContentView.heightAnchor, multiplier: 0.45),
            
            reservationStayRoom.bottomAnchor.constraint(equalTo: hotelContentView.bottomAnchor),
            reservationStayRoom.leadingAnchor.constraint(equalTo: hotelContentView.leadingAnchor),
            reservationStayRoom.trailingAnchor.constraint(equalTo: hotelContentView.trailingAnchor),
            reservationStayRoom.heightAnchor.constraint(equalTo: reservationView.heightAnchor, multiplier: 0.5),
            stayRoomLabel.topAnchor.constraint(equalTo: stayRoomCancelPrice.topAnchor),
            stayRoomLabel.leadingAnchor.constraint(equalTo: reservationStayRoom.leadingAnchor),
            stayRoomTimeLabel.topAnchor.constraint(equalTo: stayRoomLabel.bottomAnchor, constant: 5),
            stayRoomTimeLabel.leadingAnchor.constraint(equalTo: reservationStayRoom.leadingAnchor),
            stayRoomPrice.bottomAnchor.constraint(equalTo: reservationStayRoom.bottomAnchor),
            stayRoomPrice.trailingAnchor.constraint(equalTo: reservationStayRoom.trailingAnchor),
            stayRoomPercentLabel.trailingAnchor.constraint(equalTo: stayRoomPrice.leadingAnchor, constant: -5),
            stayRoomPercentLabel.bottomAnchor.constraint(equalTo: reservationStayRoom.bottomAnchor),
            stayRoomCancelPrice.bottomAnchor.constraint(equalTo: stayRoomPrice.topAnchor),
            stayRoomCancelPrice.trailingAnchor.constraint(equalTo: reservationStayRoom.trailingAnchor),
            
            reservationRentalRoom.bottomAnchor.constraint(equalTo: reservationStayRoom.topAnchor),
            reservationRentalRoom.leadingAnchor.constraint(equalTo: hotelContentView.leadingAnchor),
            reservationRentalRoom.trailingAnchor.constraint(equalTo: hotelContentView.trailingAnchor),
            reservationRentalRoom.heightAnchor.constraint(equalTo: reservationView.heightAnchor, multiplier: 0.5),
            rentalRoomLabel.topAnchor.constraint(equalTo: rentalRoomCancelPrice.topAnchor),
            rentalRoomLabel.leadingAnchor.constraint(equalTo: reservationRentalRoom.leadingAnchor),
            rentalRoomTimeLabel.topAnchor.constraint(equalTo: rentalRoomLabel.bottomAnchor, constant: 5),
            rentalRoomTimeLabel.leadingAnchor.constraint(equalTo: reservationRentalRoom.leadingAnchor),
            rentalRoomPrice.bottomAnchor.constraint(equalTo: reservationRentalRoom.bottomAnchor),
            rentalRoomPrice.trailingAnchor.constraint(equalTo: reservationRentalRoom.trailingAnchor),
            rentalRoomPercentLabel.trailingAnchor.constraint(equalTo: rentalRoomPrice.leadingAnchor, constant: -5),
            rentalRoomPercentLabel.bottomAnchor.constraint(equalTo: reservationRentalRoom.bottomAnchor),
            rentalRoomCancelPrice.bottomAnchor.constraint(equalTo: rentalRoomPrice.topAnchor),
            rentalRoomCancelPrice.trailingAnchor.constraint(equalTo: reservationRentalRoom.trailingAnchor),
            
        ])
    }
}
