//
//  FilterCharacteristicCell.swift
//  Yanolja
//
//  Created by brian은석 on 12/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class FilterCharacteristicCell: UITableViewCell {
    private let characteristicTitleLabel = UILabel()
     let lowerPriceButton = UIButton()
     let goodStayButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeView()
        self.selectionStyle = .none

    }
    private func makeView() {
        let tempArr = [characteristicTitleLabel,lowerPriceButton,goodStayButton]
        tempArr.forEach{
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        characteristicTitleLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 20).isActive = true
        characteristicTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 40).isActive = true
        characteristicTitleLabel.text = "숙소특징"
        characteristicTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        lowerPriceButton.topAnchor.constraint(equalTo: characteristicTitleLabel.bottomAnchor,constant: 15).isActive = true
        lowerPriceButton.leadingAnchor.constraint(equalTo: self.characteristicTitleLabel.leadingAnchor).isActive = true
        lowerPriceButton.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -30).isActive = true
        lowerPriceButton.setTitle("최저가 보상", for: .normal)
        lowerPriceButton.setTitleColor(.gray, for: .normal)
        lowerPriceButton.setTitleColor(.gray, for: .selected)
        lowerPriceButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        lowerPriceButton.imageView?.contentMode = .scaleAspectFit
        lowerPriceButton.setImage( #imageLiteral(resourceName: "box"), for: .normal)
        lowerPriceButton.setImage( #imageLiteral(resourceName: "checkbox"), for: .selected)
        lowerPriceButton.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)

        
        goodStayButton.topAnchor.constraint(equalTo: characteristicTitleLabel.bottomAnchor,constant: 15).isActive = true
        goodStayButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -40).isActive = true
        goodStayButton.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -30).isActive = true
        goodStayButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        goodStayButton.setTitle("좋은 숙박 Top100", for: .normal)
        goodStayButton.setTitleColor(.gray, for: .normal)
        goodStayButton.setTitleColor(.gray, for: .selected)
        goodStayButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        goodStayButton.imageView?.contentMode = .scaleAspectFit
        goodStayButton.setImage( #imageLiteral(resourceName: "box"), for: .normal)
        goodStayButton.setImage( #imageLiteral(resourceName: "checkbox"), for: .selected)
        goodStayButton.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
    }
    
    @objc private func buttonAction(sender:UIButton) {
        sender.isSelected.toggle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
