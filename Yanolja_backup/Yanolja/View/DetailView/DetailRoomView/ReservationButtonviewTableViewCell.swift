//
//  ReservationButtonviewTableViewCell.swift
//  Yanolja
//
//  Created by JinBae Jeong on 2019/08/01.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ReservationButtonviewTableViewCell: UITableViewCell {
    
    let reservationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        
        return view
    }()
    
    let rentableView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let rentableTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "대실"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        return label
    }()
    
    let hoursAvailableTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "이용시간"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.5333333333, green: 0.5333333333, blue: 0.5333333333, alpha: 1)
        
        return label
    }()
    
    let hoursAvailableCont: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        
        return label
    }()
    
    let opertationTimeTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "운영시간"
        label.textColor = #colorLiteral(red: 0.5333333333, green: 0.5333333333, blue: 0.5333333333, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    let opertationTimeCont: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        
        return label
    }()
    
    let defaultRentablePrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    let saleTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "판매가"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .right
        
        return label
    }()
    
    let rentablePrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    let rentablePriceWon: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "원"
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    let divideView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        
        return view
    }()
    
    let stayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let stayTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "숙박"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        return label
    }()
    
    let checkInTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "체크인"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.5333333333, green: 0.5333333333, blue: 0.5333333333, alpha: 1)
        
        return label
    }()
    
    let checkInCont: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        
        return label
    }()
    
    let checkOutTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "체크아웃"
        label.textColor = #colorLiteral(red: 0.5333333333, green: 0.5333333333, blue: 0.5333333333, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    let checkOutCont: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        
        return label
    }()
    
    let defaultStayPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    let saleTitle2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "판매가"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .right
        
        return label
    }()
    
    let stayPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    let stayPriceWon: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "원"
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        contentView.addSubview(reservationView)
        reservationView.addSubview(rentableView)
        rentableView.addSubview(rentableTitle)
        rentableView.addSubview(hoursAvailableTitle)
        rentableView.addSubview(hoursAvailableCont)
        rentableView.addSubview(opertationTimeTitle)
        rentableView.addSubview(opertationTimeCont)
        rentableView.addSubview(defaultRentablePrice)
        rentableView.addSubview(saleTitle)
        rentableView.addSubview(rentablePrice)
        rentableView.addSubview(rentablePriceWon)
        
        reservationView.addSubview(divideView)
        
        reservationView.addSubview(stayView)
        stayView.addSubview(stayTitle)
        stayView.addSubview(checkInTitle)
        stayView.addSubview(checkInCont)
        stayView.addSubview(checkOutTitle)
        stayView.addSubview(checkOutCont)
        stayView.addSubview(defaultStayPrice)
        stayView.addSubview(saleTitle2)
        stayView.addSubview(stayPrice)
        stayView.addSubview(stayPriceWon)
        
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            reservationView.topAnchor.constraint(equalTo: contentView.topAnchor),
            reservationView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            reservationView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            reservationView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            rentableView.topAnchor.constraint(equalTo: reservationView.topAnchor),
            rentableView.leadingAnchor.constraint(equalTo: reservationView.leadingAnchor),
            rentableView.trailingAnchor.constraint(equalTo: reservationView.trailingAnchor),
            rentableView.bottomAnchor.constraint(equalTo: divideView.topAnchor),
            rentableTitle.topAnchor.constraint(equalTo: rentableView.topAnchor, constant: 20),
            rentableTitle.leadingAnchor.constraint(equalTo: rentableView.leadingAnchor, constant: 20),
            rentableTitle.trailingAnchor.constraint(equalTo: rentableView.trailingAnchor, constant: -20),
            rentableTitle.bottomAnchor.constraint(equalTo: hoursAvailableTitle.topAnchor, constant: -10),
            hoursAvailableTitle.leadingAnchor.constraint(equalTo: rentableTitle.leadingAnchor),
            hoursAvailableTitle.trailingAnchor.constraint(equalTo: hoursAvailableCont.leadingAnchor, constant: -10),
            hoursAvailableTitle.bottomAnchor.constraint(equalTo: opertationTimeTitle.topAnchor, constant: -5),
            hoursAvailableCont.bottomAnchor.constraint(equalTo: hoursAvailableTitle.bottomAnchor),
            opertationTimeTitle.leadingAnchor.constraint(equalTo: rentableTitle.leadingAnchor),
            opertationTimeTitle.trailingAnchor.constraint(equalTo: opertationTimeCont.leadingAnchor, constant: -10),
            opertationTimeTitle.bottomAnchor.constraint(equalTo: saleTitle.topAnchor, constant: -20),
            opertationTimeCont.bottomAnchor.constraint(equalTo: opertationTimeTitle.bottomAnchor),
            
            defaultRentablePrice.trailingAnchor.constraint(equalTo: saleTitle.trailingAnchor),
            defaultRentablePrice.bottomAnchor.constraint(equalTo: saleTitle.topAnchor, constant: -5),
            
            saleTitle.widthAnchor.constraint(equalTo: rentableView.widthAnchor, constant: -40),
            saleTitle.leadingAnchor.constraint(equalTo: rentableTitle.leadingAnchor),
            saleTitle.trailingAnchor.constraint(equalTo: rentableTitle.trailingAnchor),
            saleTitle.bottomAnchor.constraint(equalTo: rentablePrice.topAnchor, constant: -3),
            rentablePrice.bottomAnchor.constraint(equalTo: rentableView.bottomAnchor, constant: -20),
            rentablePrice.trailingAnchor.constraint(equalTo: rentablePriceWon.leadingAnchor),
            rentablePriceWon.trailingAnchor.constraint(equalTo: rentableTitle.trailingAnchor),
            rentablePriceWon.bottomAnchor.constraint(equalTo: rentablePrice.bottomAnchor, constant: -2),
            
            //
            divideView.widthAnchor.constraint(equalTo: reservationView.widthAnchor),
            divideView.heightAnchor.constraint(equalToConstant: 1),
            divideView.bottomAnchor.constraint(equalTo: stayView.topAnchor),
//            //
            stayView.leadingAnchor.constraint(equalTo: reservationView.leadingAnchor),
            stayView.trailingAnchor.constraint(equalTo: reservationView.trailingAnchor),
            stayView.bottomAnchor.constraint(equalTo: reservationView.bottomAnchor),
            
            stayTitle.topAnchor.constraint(equalTo: stayView.topAnchor, constant: 20),
            stayTitle.leadingAnchor.constraint(equalTo: stayView.leadingAnchor, constant: 20),
            stayTitle.trailingAnchor.constraint(equalTo: stayView.trailingAnchor, constant: -20),
            stayTitle.bottomAnchor.constraint(equalTo: checkInTitle.topAnchor, constant: -10),
            checkInTitle.leadingAnchor.constraint(equalTo: stayTitle.leadingAnchor),
            checkInTitle.trailingAnchor.constraint(equalTo: checkInCont.leadingAnchor, constant: -10),
            checkInTitle.bottomAnchor.constraint(equalTo: checkOutTitle.topAnchor, constant: -5),
            checkInCont.bottomAnchor.constraint(equalTo: checkInTitle.bottomAnchor),
            checkOutTitle.leadingAnchor.constraint(equalTo: stayTitle.leadingAnchor),
            checkOutTitle.trailingAnchor.constraint(equalTo: checkOutCont.leadingAnchor, constant: -10),
            checkOutTitle.bottomAnchor.constraint(equalTo: saleTitle2.topAnchor, constant: -20),
            checkOutCont.bottomAnchor.constraint(equalTo: checkOutTitle.bottomAnchor),

            defaultStayPrice.trailingAnchor.constraint(equalTo: saleTitle2.trailingAnchor),
            defaultStayPrice.bottomAnchor.constraint(equalTo: saleTitle2.topAnchor, constant: -5),

            saleTitle2.widthAnchor.constraint(equalTo: stayView.widthAnchor, constant: -40),
            saleTitle2.leadingAnchor.constraint(equalTo: stayTitle.leadingAnchor),
            saleTitle2.trailingAnchor.constraint(equalTo: stayTitle.trailingAnchor),
            saleTitle2.bottomAnchor.constraint(equalTo: stayPrice.topAnchor, constant: -3),
            stayPrice.bottomAnchor.constraint(equalTo: stayView.bottomAnchor, constant: -20),
            stayPrice.trailingAnchor.constraint(equalTo: stayPriceWon.leadingAnchor),
            stayPriceWon.trailingAnchor.constraint(equalTo: stayTitle.trailingAnchor),
            stayPriceWon.bottomAnchor.constraint(equalTo: stayPrice.bottomAnchor, constant: -2),
        ])
    }
}
