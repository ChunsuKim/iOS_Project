//
//  FilterSortCell.swift
//  Yanolja
//
//  Created by brian은석 on 12/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class FilterSortCell: UITableViewCell {

    private let titleLabel = UILabel()
    let sortOfRecommendButton = UIButton()
    let sortOfNumberOfReviewsButton = UIButton()
    let sortOfNumberOfSavesButton = UIButton()
    let sortOfHighPriceButton = UIButton()
    let sortOfLowPriceButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeView()
        self.selectionStyle = .none
        initMethod()
    }
    private func makeView() {
        let tempArr = [titleLabel,sortOfRecommendButton,sortOfNumberOfReviewsButton,sortOfNumberOfSavesButton,sortOfHighPriceButton,sortOfLowPriceButton]
        tempArr.forEach{
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        let leadingConstant: CGFloat = 40
        
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: leadingConstant).isActive = true
        titleLabel.text = "정렬"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        
        sortOfRecommendButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 8).isActive = true
        sortOfRecommendButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant).isActive = true
        sortOfRecommendButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        sortOfRecommendButton.setTitle("야놀자 추천순", for: .normal)
        sortOfRecommendButton.setTitleColor(.gray, for: .normal)
        sortOfRecommendButton.setTitle("야놀자 추천순", for: .selected)
        sortOfRecommendButton.setTitleColor(.white, for: .selected)
        sortOfRecommendButton.backgroundColor = .white
        sortOfRecommendButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        sortOfRecommendButton.layer.borderWidth = 1
        sortOfRecommendButton.layer.borderColor = #colorLiteral(red: 0.8814956546, green: 0.8863850236, blue: 0.8905579448, alpha: 1)
        sortOfRecommendButton.addTarget(self, action: #selector(buttonAction(selected:)), for: .touchUpInside)
        sortOfRecommendButton.tag = 0
        
        sortOfNumberOfReviewsButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 8).isActive = true
        sortOfNumberOfReviewsButton.leadingAnchor.constraint(equalTo: sortOfRecommendButton.trailingAnchor, constant: 5).isActive = true
        sortOfNumberOfReviewsButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        sortOfNumberOfReviewsButton.setTitle("후기많은 순", for: .normal)
        sortOfNumberOfReviewsButton.setTitleColor(.gray, for: .normal)
        sortOfNumberOfReviewsButton.setTitle("후기많은 순", for: .selected)
        sortOfNumberOfReviewsButton.setTitleColor(.white, for: .selected)
        sortOfNumberOfReviewsButton.backgroundColor = .white
        sortOfNumberOfReviewsButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        sortOfNumberOfReviewsButton.widthAnchor.constraint(equalTo: sortOfRecommendButton.widthAnchor).isActive = true
        sortOfNumberOfReviewsButton.layer.borderWidth = 1
        sortOfNumberOfReviewsButton.layer.borderColor = #colorLiteral(red: 0.8814956546, green: 0.8863850236, blue: 0.8905579448, alpha: 1)
        sortOfNumberOfReviewsButton.addTarget(self, action: #selector(buttonAction(selected:)), for: .touchUpInside)
        sortOfNumberOfReviewsButton.tag = 1

        
        sortOfNumberOfSavesButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 8).isActive = true
        sortOfNumberOfSavesButton.leadingAnchor.constraint(equalTo: sortOfNumberOfReviewsButton.trailingAnchor, constant: 5).isActive = true
        sortOfNumberOfSavesButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -leadingConstant).isActive = true
        sortOfNumberOfSavesButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        sortOfNumberOfSavesButton.setTitle("찜 많은 순", for: .normal)
        sortOfNumberOfSavesButton.setTitleColor(.gray, for: .normal)
        sortOfNumberOfSavesButton.setTitle("찜 많은 순", for: .selected)
        sortOfNumberOfSavesButton.setTitleColor(.white, for: .selected)
        sortOfNumberOfSavesButton.backgroundColor = .white
        sortOfNumberOfSavesButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        sortOfNumberOfSavesButton.widthAnchor.constraint(equalTo: sortOfNumberOfReviewsButton.widthAnchor).isActive = true
        sortOfNumberOfSavesButton.layer.borderWidth = 1
        sortOfNumberOfSavesButton.layer.borderColor = #colorLiteral(red: 0.8814956546, green: 0.8863850236, blue: 0.8905579448, alpha: 1)
        sortOfNumberOfSavesButton.addTarget(self, action: #selector(buttonAction(selected:)), for: .touchUpInside)
        sortOfNumberOfSavesButton.tag = 2
        

        sortOfHighPriceButton.topAnchor.constraint(equalTo: sortOfRecommendButton.bottomAnchor,constant: 8).isActive = true
        sortOfHighPriceButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstant).isActive = true
        sortOfHighPriceButton.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -20).isActive = true
        sortOfHighPriceButton.heightAnchor.constraint(equalToConstant: 35).isActive = true

        sortOfHighPriceButton.setTitle("숙박 예약가 높은 순", for: .normal)
        sortOfHighPriceButton.setTitleColor(.gray, for: .normal)
        sortOfHighPriceButton.setTitle("숙박 예약가 높은 순", for: .selected)
        sortOfHighPriceButton.setTitleColor(.white, for: .selected)
        sortOfHighPriceButton.backgroundColor = .white
        sortOfHighPriceButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        sortOfHighPriceButton.layer.borderWidth = 1
        sortOfHighPriceButton.layer.borderColor = #colorLiteral(red: 0.8814956546, green: 0.8863850236, blue: 0.8905579448, alpha: 1)
        sortOfHighPriceButton.addTarget(self, action: #selector(buttonAction(selected:)), for: .touchUpInside)
        sortOfHighPriceButton.tag = 3

        
        
        sortOfLowPriceButton.topAnchor.constraint(equalTo: sortOfRecommendButton.bottomAnchor,constant: 8).isActive = true
        sortOfLowPriceButton.leadingAnchor.constraint(equalTo: sortOfHighPriceButton.trailingAnchor, constant: 5).isActive = true
        sortOfLowPriceButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -leadingConstant).isActive = true
        sortOfLowPriceButton.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -20).isActive = true
        sortOfLowPriceButton.heightAnchor.constraint(equalToConstant: 35).isActive = true

        sortOfLowPriceButton.setTitle("숙박 예약가 낮은 순", for: .normal)
        sortOfLowPriceButton.setTitleColor(.gray, for: .normal)
        sortOfLowPriceButton.setTitle("숙박 예약가 낮은 순", for: .selected)
        sortOfLowPriceButton.setTitleColor(.white, for: .selected)
        sortOfLowPriceButton.backgroundColor = .white
        sortOfLowPriceButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        sortOfLowPriceButton.widthAnchor.constraint(equalTo: sortOfHighPriceButton.widthAnchor).isActive = true
        sortOfLowPriceButton.layer.borderWidth = 1
        sortOfLowPriceButton.layer.borderColor = #colorLiteral(red: 0.8814956546, green: 0.8863850236, blue: 0.8905579448, alpha: 1)
        sortOfLowPriceButton.addTarget(self, action: #selector(buttonAction(selected:)), for: .touchUpInside)
        sortOfLowPriceButton.tag = 4
        
    }
    
    private func initMethod() {
    sortOfRecommendButton.isSelected = true
    sortOfRecommendButton.backgroundColor = .red

    }
    @objc func buttonAction(selected button: UIButton) {
        initButtonSelect()
        button.isSelected = true
        button.backgroundColor = .red
        
        let filterString = ["","review","wish","priceHigh","priceLow"]
        singleTon.filter = filterString[button.tag]
    }
  
    private func initButtonSelect() {
        let temp = [sortOfRecommendButton,sortOfNumberOfReviewsButton,sortOfNumberOfSavesButton,sortOfHighPriceButton,sortOfLowPriceButton]
        temp.forEach{$0.isSelected = false; $0.backgroundColor = .white}
    }
    
    func initButtonAction() {
        initButtonSelect()
        sortOfRecommendButton.isSelected = true
        sortOfRecommendButton.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
