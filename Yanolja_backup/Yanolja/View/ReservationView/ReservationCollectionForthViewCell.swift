//
//  ReservationCollectionForthViewCell.swift
//  Yanolja
//
//  Created by brian은석 on 30/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

protocol forthCellCheckBoxDelegate {
    func forthCellCheckBox(sender:UIButton)
}


class ReservationCollectionForthViewCell: UICollectionViewCell {
   
    let checkButtonAll = UIButton()
    let checkButtonCancelProtocolAgree = UIButton()
    let checkButtonPrivacyAgree = UIButton()

    let lookFirstButton = UIButton()
    let lookSecondButton = UIButton()

    var delegate: forthCellCheckBoxDelegate?

    let paymentButton = UIButton()
    
    let cautionInfoBottomLabel = UILabel()
    var amount = "246,000"

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    private func configure() {
        let tempArr = [checkButtonAll,checkButtonCancelProtocolAgree,checkButtonPrivacyAgree,lookFirstButton,lookSecondButton,paymentButton,cautionInfoBottomLabel]
        tempArr.forEach{self.addSubview($0); $0.translatesAutoresizingMaskIntoConstraints = false}
        
    

        checkButtonAll.setImage(#imageLiteral(resourceName: "box"), for: .normal)
        checkButtonAll.setImage(#imageLiteral(resourceName: "checkbox"), for: .selected)

        checkButtonAll.topAnchor.constraint(equalTo: self.topAnchor,constant: 20).isActive = true
        checkButtonAll.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15).isActive = true
        checkButtonAll.setTitle(" 전체동의", for: .normal)
        checkButtonAll.setTitleColor(.black, for: .normal)
        checkButtonAll.setTitleColor(.black, for: .selected)
        checkButtonAll.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        checkButtonAll.setImage(#imageLiteral(resourceName: "box"), for: .normal)
        checkButtonAll.setImage(#imageLiteral(resourceName: "checkbox"), for: .selected)
        checkButtonAll.addTarget(self, action: #selector(checkboxTap(sender:)), for: .touchUpInside)
   
        checkButtonCancelProtocolAgree.topAnchor.constraint(equalTo: checkButtonAll.bottomAnchor,constant: 5).isActive = true
        checkButtonCancelProtocolAgree.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 30).isActive = true
        checkButtonCancelProtocolAgree.setTitle(" (필수) 취소 규정 동의", for: .normal)
        checkButtonCancelProtocolAgree.setTitleColor(.black, for: .normal)
        checkButtonCancelProtocolAgree.setTitleColor(.black, for: .selected)
        checkButtonCancelProtocolAgree.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        checkButtonCancelProtocolAgree.setImage(#imageLiteral(resourceName: "box"), for: .normal)
        checkButtonCancelProtocolAgree.setImage(#imageLiteral(resourceName: "checkbox"), for: .selected)
        checkButtonCancelProtocolAgree.addTarget(self, action: #selector(checkboxTap(sender:)), for: .touchUpInside)

        checkButtonPrivacyAgree.topAnchor.constraint(equalTo: checkButtonCancelProtocolAgree.bottomAnchor,constant: 5).isActive = true
        checkButtonPrivacyAgree.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 30).isActive = true
        checkButtonPrivacyAgree.setTitle(" (필수) 개인정보 제3자 제공동의", for: .normal)
        checkButtonPrivacyAgree.setTitleColor(.black, for: .normal)
        checkButtonPrivacyAgree.setTitleColor(.black, for: .selected)
        checkButtonPrivacyAgree.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        checkButtonPrivacyAgree.setImage(#imageLiteral(resourceName: "box"), for: .normal)
        checkButtonPrivacyAgree.setImage(#imageLiteral(resourceName: "checkbox"), for: .selected)
        checkButtonPrivacyAgree.addTarget(self, action: #selector(checkboxTap(sender:)), for: .touchUpInside)

        
        paymentButton.topAnchor.constraint(equalTo: checkButtonPrivacyAgree.bottomAnchor,constant: 45).isActive = true
        paymentButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15).isActive = true
        paymentButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15).isActive = true
        paymentButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        paymentButton.setTitle("\(amount)원 결제하기", for: .normal)
        paymentButton.setTitleColor(.white, for: .normal)
        paymentButton.backgroundColor = #colorLiteral(red: 0.9996150136, green: 0.2039119303, blue: 0.471554637, alpha: 1)
        paymentButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)

        cautionInfoBottomLabel.topAnchor.constraint(equalTo: paymentButton.bottomAnchor,constant: 45).isActive = true
        cautionInfoBottomLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15).isActive = true
        cautionInfoBottomLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15).isActive = true
        cautionInfoBottomLabel.text = "(주)야놀자는 통신판매중개자로서, 통신판매의 당사자가 아니라는 사실을 고지하며 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다."
        cautionInfoBottomLabel.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight)
        cautionInfoBottomLabel.textColor = #colorLiteral(red: 0.7276031971, green: 0.7281637788, blue: 0.7276900411, alpha: 1)
        cautionInfoBottomLabel.numberOfLines = 3
        
        
        
    }
    
    @objc private func checkboxTap(sender:UIButton) {
        delegate?.forthCellCheckBox(sender: sender)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }

}
