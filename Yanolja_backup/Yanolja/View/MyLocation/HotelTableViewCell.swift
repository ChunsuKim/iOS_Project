//
//  HotelTableViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/07/15.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HotelTableViewCell: UITableViewCell {
    
    // MARK: - Properties
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
        
        return imageView
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
        label.text = "100,000"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    let stayRoomPriceWon: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "원"
        label.font = UIFont.systemFont(ofSize: 13)
        
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
        
        cellImage.contentMode = .scaleAspectFill
        
        configureDefaultCell()
    }
    
    func configureObject(data: StayListElement) {
        put(mainImage: data.mainImage , stay: data.stay, averageGrade: data.averageGrade, totalComments: data.totalComments, ownerComments: data.ownerComments, directions: data.directions, daysPrice: data.daysPrice)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureDefaultCell() {
        addSubview(totalWrap)
        totalWrap.addSubview(cellImage)
        totalWrap.addSubview(hotelGrade)
        totalWrap.addSubview(hotelTitle)
        totalWrap.addSubview(starImage)
        totalWrap.addSubview(commentImage)
        totalWrap.addSubview(ratingLabel)
        totalWrap.addSubview(commentLabel)
        totalWrap.addSubview(locationIcon)
        totalWrap.addSubview(locationLabel)
        totalWrap.addSubview(reservationStayRoom)
        reservationStayRoom.addSubview(stayRoomLabel)
        reservationStayRoom.addSubview(stayRoomTimeLabel)
        reservationStayRoom.addSubview(stayRoomCancelPrice)
        reservationStayRoom.addSubview(stayRoomPercentLabel)
        reservationStayRoom.addSubview(stayRoomPrice)
        reservationStayRoom.addSubview(stayRoomPriceWon)
        
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
            cellImage.heightAnchor.constraint(equalToConstant: 200),
            cellImage.bottomAnchor.constraint(equalTo: totalWrap.bottomAnchor),
            cellImage.widthAnchor.constraint(equalTo: totalWrap.widthAnchor, multiplier: 0.35),
            cellImage.trailingAnchor.constraint(equalTo: hotelGrade.leadingAnchor, constant: -10),
            
            hotelGrade.topAnchor.constraint(equalTo: totalWrap.topAnchor),
            hotelGrade.bottomAnchor.constraint(equalTo: hotelTitle.topAnchor),
            hotelTitle.leadingAnchor.constraint(equalTo: hotelGrade.leadingAnchor),
            hotelTitle.bottomAnchor.constraint(equalTo: starImage.topAnchor),
            starImage.leadingAnchor.constraint(equalTo: hotelGrade.leadingAnchor),
            starImage.trailingAnchor.constraint(equalTo: ratingLabel.leadingAnchor, constant: -3),
            starImage.bottomAnchor.constraint(equalTo: locationIcon.topAnchor),
            starImage.widthAnchor.constraint(equalToConstant: 15),
            starImage.heightAnchor.constraint(equalToConstant: 15),
            ratingLabel.centerYAnchor.constraint(equalTo: starImage.centerYAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: commentImage.leadingAnchor, constant: -10),
            commentImage.centerYAnchor.constraint(equalTo: starImage.centerYAnchor),
            commentImage.trailingAnchor.constraint(equalTo: commentLabel.leadingAnchor, constant: -3),
            commentImage.widthAnchor.constraint(equalToConstant: 15),
            commentImage.heightAnchor.constraint(equalToConstant: 15),
            commentLabel.centerYAnchor.constraint(equalTo: starImage.centerYAnchor),
            locationIcon.leadingAnchor.constraint(equalTo: hotelGrade.leadingAnchor),
            locationIcon.trailingAnchor.constraint(equalTo: locationLabel.leadingAnchor),
            locationIcon.widthAnchor.constraint(equalToConstant: 15),
            locationIcon.heightAnchor.constraint(equalToConstant: 15),
            locationLabel.centerYAnchor.constraint(equalTo: locationIcon.centerYAnchor),
            
            reservationStayRoom.leadingAnchor.constraint(equalTo: hotelGrade.leadingAnchor),
            reservationStayRoom.bottomAnchor.constraint(equalTo: totalWrap.bottomAnchor),
            reservationStayRoom.trailingAnchor.constraint(equalTo: totalWrap.trailingAnchor),
            stayRoomLabel.topAnchor.constraint(equalTo: reservationStayRoom.topAnchor),
            stayRoomLabel.leadingAnchor.constraint(equalTo: reservationStayRoom.leadingAnchor),
            stayRoomLabel.bottomAnchor.constraint(equalTo: stayRoomTimeLabel.topAnchor, constant: -5),
            stayRoomCancelPrice.bottomAnchor.constraint(equalTo: stayRoomLabel.bottomAnchor),
            stayRoomCancelPrice.trailingAnchor.constraint(equalTo: reservationStayRoom.trailingAnchor),
            stayRoomTimeLabel.leadingAnchor.constraint(equalTo: reservationStayRoom.leadingAnchor),
            stayRoomTimeLabel.bottomAnchor.constraint(equalTo: reservationStayRoom.bottomAnchor, constant: -5),
            stayRoomPriceWon.trailingAnchor.constraint(equalTo: reservationStayRoom.trailingAnchor),
            stayRoomPriceWon.bottomAnchor.constraint(equalTo: reservationStayRoom.bottomAnchor),
            stayRoomPrice.trailingAnchor.constraint(equalTo: stayRoomPriceWon.leadingAnchor, constant: -2),
            stayRoomPrice.bottomAnchor.constraint(equalTo: stayRoomPriceWon.bottomAnchor),
            stayRoomPercentLabel.trailingAnchor.constraint(equalTo: stayRoomPrice.leadingAnchor, constant: -5),
            stayRoomPercentLabel.bottomAnchor.constraint(equalTo: stayRoomPriceWon.bottomAnchor),
            
            
            ])
    }
    
    func put(mainImage:String,stay:String, averageGrade: Double ,totalComments:Int,ownerComments:Int ,directions:String , daysPrice:String) {
        cellImage.downloadImageFrom(mainImage, contentMode: .scaleAspectFill)
        self.hotelTitle.text = stay
        ratingLabel.text = "\(averageGrade)"
        commentLabel.text = "\(totalComments)"
        commentLabel.text = "\(ownerComments)"
        locationLabel.text = directions
        stayRoomPrice.text = daysPrice
    }
    
}
