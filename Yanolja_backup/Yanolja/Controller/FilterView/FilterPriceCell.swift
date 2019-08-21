//
//  FilterPriceCell.swift
//  Yanolja
//
//  Created by brian은석 on 12/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class FilterPriceCell: UITableViewCell {
    private let searchLabel = UILabel()
    let slider = UISlider()
    private let lowMoneyLabel = UILabel()
    private let highMoneyLabel = UILabel()
    var moneyPrice: Int = 50 {
        willSet(new) {
            highMoneyLabel.text = "\(new)만원"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeView()
        self.selectionStyle = .none

    }
    
    private func makeView() {
        self.addSubview(searchLabel)
        searchLabel.translatesAutoresizingMaskIntoConstraints = false
        searchLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 20).isActive = true
        searchLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 40).isActive = true
        searchLabel.text = "예약특가 검색"
        searchLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        self.addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.topAnchor.constraint(equalTo: searchLabel.bottomAnchor,constant: 15).isActive = true
        slider.leadingAnchor.constraint(equalTo: self.searchLabel.leadingAnchor).isActive = true
        slider.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -40).isActive = true
        slider.addTarget(self, action: #selector(sliderAction(sender:)), for: .valueChanged)
        slider.tintColor = singleTon.mainColor
        slider.value = 1
        
        self.addSubview(lowMoneyLabel)
        lowMoneyLabel.translatesAutoresizingMaskIntoConstraints = false
        lowMoneyLabel.topAnchor.constraint(equalTo: slider.bottomAnchor,constant: 10).isActive = true
        lowMoneyLabel.leadingAnchor.constraint(equalTo: slider.leadingAnchor).isActive = true
        lowMoneyLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -30).isActive = true
        lowMoneyLabel.text = "1만원"
        lowMoneyLabel.textColor = singleTon.mainColor
        lowMoneyLabel.font = UIFont.systemFont(ofSize: 13, weight: .ultraLight)

        self.addSubview(highMoneyLabel)
        highMoneyLabel.translatesAutoresizingMaskIntoConstraints = false
        highMoneyLabel.topAnchor.constraint(equalTo: slider.bottomAnchor,constant: 10).isActive = true
        highMoneyLabel.trailingAnchor.constraint(equalTo: slider.trailingAnchor).isActive = true
        highMoneyLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -30).isActive = true
        highMoneyLabel.text = "\(moneyPrice)만원"
        highMoneyLabel.textColor = singleTon.mainColor
        highMoneyLabel.font = UIFont.systemFont(ofSize: 13, weight: .ultraLight)
    }
    
    @objc func sliderAction(sender:UISlider) {
        moneyPrice = Int((sender.value * 49) + 1)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
