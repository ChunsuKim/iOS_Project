//
//  ReservationCollectionSecondViewCell.swift
//  Yanolja
//
//  Created by brian은석 on 30/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ReservationCollectionSecondViewCell: UICollectionViewCell {
    // 맨위
    let reservedInfo = UILabel()
    let safeNumberInfo = UILabel()
    
    //예약자 이름
    let reservedName = UILabel()
    let reservedNameTextField = UITextField()
    let reservedNameBarView = UIView()

    //예약자 번호
    let reservedNumber = UILabel()
    let reservedNumberTextField = UITextField()
    let reservedNumberBarView = UIView()
    let changeButton = UIButton()
    
    // 다른사람이 방문 뷰
    let checkBox = UIButton()
    let infoLabel = UILabel()
    var delegate: checkBoxDelegate?
    // FIXME: 다른사람 방문 셀렉트 될때 뷰 추가 등장..;
    // 버튼 도보 or 차량 버튼
    
    let walkButton = UIButton()
    let carButton = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        reservedNameTextField.delegate = self
        reservedNumberTextField.delegate = self
    }
    
    func configure() {
        let tempArr = [reservedInfo,safeNumberInfo,reservedName,reservedNameTextField,reservedNameBarView,reservedNumber,reservedNumberTextField,reservedNumberBarView,changeButton,checkBox,infoLabel,walkButton,carButton]
        tempArr.forEach{self.addSubview($0) ; $0.translatesAutoresizingMaskIntoConstraints = false}

        //top
        reservedInfo.topAnchor.constraint(equalTo: self.topAnchor,constant: 15).isActive = true
        reservedInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15).isActive = true
        reservedInfo.text = "예약정보"
        
        safeNumberInfo.topAnchor.constraint(equalTo: self.topAnchor,constant: 15).isActive = true
        safeNumberInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15).isActive = true
        safeNumberInfo.text = "안심번호 적용중"
        safeNumberInfo.font = UIFont.systemFont(ofSize: 14)
        safeNumberInfo.textColor = #colorLiteral(red: 0.9996150136, green: 0.2039119303, blue: 0.471554637, alpha: 1)

        // 예약자 이름 뷰
        reservedName.topAnchor.constraint(equalTo: reservedInfo.bottomAnchor,constant: 30).isActive = true
        reservedName.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15).isActive = true
        reservedName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        reservedName.widthAnchor.constraint(equalToConstant: 90).isActive = true
        reservedName.text = "예약자 이름"
        reservedName.textColor = #colorLiteral(red: 0.6313229203, green: 0.6314007044, blue: 0.6312964559, alpha: 1)


        reservedNameTextField.topAnchor.constraint(equalTo: reservedName.topAnchor).isActive = true
        reservedNameTextField.leadingAnchor.constraint(equalTo: reservedName.trailingAnchor,constant: 15).isActive = true
        reservedNameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15).isActive = true
        reservedNameTextField.placeholder = "체크인 시 필요합니다."
        reservedNameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        reservedNameBarView.topAnchor.constraint(equalTo: reservedNameTextField.bottomAnchor).isActive = true
        reservedNameBarView.leadingAnchor.constraint(equalTo: reservedName.trailingAnchor,constant: 15).isActive = true
        reservedNameBarView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15).isActive = true
        reservedNameBarView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        reservedNameBarView.backgroundColor = #colorLiteral(red: 0.4823141098, green: 0.4823748469, blue: 0.4822933078, alpha: 1)
        
        
        // 예약자 번호 뷰
        reservedNumber.topAnchor.constraint(equalTo: reservedName.bottomAnchor,constant: 30).isActive = true
        reservedNumber.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15).isActive = true
        reservedNumber.heightAnchor.constraint(equalToConstant: 30).isActive = true
        reservedNumber.widthAnchor.constraint(equalToConstant: 90).isActive = true
        reservedNumber.text = "예약자 번호"
        reservedNumber.textColor = #colorLiteral(red: 0.6313229203, green: 0.6314007044, blue: 0.6312964559, alpha: 1)

        reservedNumberTextField.topAnchor.constraint(equalTo: reservedName.bottomAnchor,constant: 30).isActive = true
        reservedNumberTextField.leadingAnchor.constraint(equalTo: reservedNumber.trailingAnchor,constant: 15).isActive = true
        reservedNumberTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -60).isActive = true
        reservedNumberTextField.placeholder = singleTon.loginUser.last?.phoneNumber
        reservedNumberTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        reservedNumberTextField.isEnabled = false
        
        
        reservedNumberBarView.topAnchor.constraint(equalTo: reservedNumberTextField.bottomAnchor).isActive = true
        reservedNumberBarView.leadingAnchor.constraint(equalTo: reservedNumber.trailingAnchor,constant: 15).isActive = true
        reservedNumberBarView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15).isActive = true
        reservedNumberBarView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        reservedNumberBarView.backgroundColor = #colorLiteral(red: 0.4823141098, green: 0.4823748469, blue: 0.4822933078, alpha: 1)

        
        changeButton.topAnchor.constraint(equalTo: reservedName.bottomAnchor,constant: 30).isActive = true
        changeButton.leadingAnchor.constraint(equalTo: reservedNumberTextField.trailingAnchor).isActive = true
        changeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15).isActive = true
        changeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        changeButton.setTitle("변경", for: .normal)
        changeButton.setTitleColor(#colorLiteral(red: 0.9985510707, green: 0.2026679814, blue: 0.493085146, alpha: 1), for: .normal)
        
        // 체크 박스 버튼 뷰
        checkBox.topAnchor.constraint(equalTo: reservedNumber.bottomAnchor,constant: 30).isActive = true
        checkBox.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15).isActive = true
        checkBox.setTitle(" 다른 사람이 방문할 거에요", for: .normal)
        checkBox.setTitleColor(.black, for: .normal)
        checkBox.setTitleColor(.black, for: .selected)
        checkBox.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        checkBox.setImage(#imageLiteral(resourceName: "box"), for: .normal)
        checkBox.setImage(#imageLiteral(resourceName: "checkbox"), for: .selected)
        checkBox.addTarget(self, action: #selector(checkboxTap), for: .touchUpInside)
        checkBox.isSelected = false
        
        walkButton.topAnchor.constraint(equalTo: checkBox.bottomAnchor,constant: 15).isActive = true
        walkButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15).isActive = true
//        walkButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant:-widthConstant).isActive = true
        walkButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        walkButton.setTitle("도보", for: .normal)
        walkButton.setTitleColor(#colorLiteral(red: 0.9985510707, green: 0.2026679814, blue: 0.493085146, alpha: 1), for: .normal)
        walkButton.setTitle("도보", for: .selected)
        walkButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .selected)
        walkButton.layer.borderWidth = 1
        walkButton.layer.borderColor = #colorLiteral(red: 0.9985510707, green: 0.2026679814, blue: 0.493085146, alpha: 1)
        walkButton.layer.cornerRadius = 25
        walkButton.addTarget(self, action: #selector(buttonSelectAction(of:)), for: .touchUpInside)
        
        carButton.topAnchor.constraint(equalTo: checkBox.bottomAnchor,constant: 15).isActive = true
        carButton.leadingAnchor.constraint(equalTo: walkButton.trailingAnchor,constant: 10).isActive = true
        carButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant:-15).isActive = true
        carButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        carButton.setTitle("차량", for: .normal)
        carButton.setTitleColor(#colorLiteral(red: 0.9985510707, green: 0.2026679814, blue: 0.493085146, alpha: 1), for: .normal)
        carButton.setTitle("차량", for: .selected)
        carButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .selected)

        carButton.layer.borderWidth = 1
        carButton.layer.borderColor = #colorLiteral(red: 0.9985510707, green: 0.2026679814, blue: 0.493085146, alpha: 1)
        carButton.layer.cornerRadius = 25
        carButton.widthAnchor.constraint(equalTo: walkButton.widthAnchor).isActive = true
        carButton.addTarget(self, action: #selector(buttonSelectAction(of:)), for: .touchUpInside)

        
    }
    
    @objc private func checkboxTap() {
        delegate?.possibleChkButton()
    }
    
    @objc private func buttonSelectAction(of button:UIButton) {
        carButton.isSelected = false
        walkButton.isSelected = false
        
        carButton.backgroundColor = .white
        walkButton.backgroundColor = .white

        button.isSelected = true
        button.backgroundColor = #colorLiteral(red: 0.9985510707, green: 0.2026679814, blue: 0.493085146, alpha: 1)
        singleTon.walkToGo = button.currentTitle!
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}

extension ReservationCollectionSecondViewCell :UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        reservedNameBarView.backgroundColor = #colorLiteral(red: 0.9985510707, green: 0.2026679814, blue: 0.493085146, alpha: 1)
        reservedNameTextField.becomeFirstResponder()
    }
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        reservedNameBarView.backgroundColor = #colorLiteral(red: 0.4823141098, green: 0.4823748469, blue: 0.4822933078, alpha: 1)
        reservedNameTextField.resignFirstResponder()
        return true
    }
}
