//
//  ResevationViewController.swift
//  Yanolja
//
//  Created by brian은석 on 30/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ReservationViewController: UIViewController {

    // MARK: - properties
    
    let topNaviCustom = UIView()
    let backButton = UIButton()
    let stayNaviTitle = UILabel()
    let exitButton = UIButton()
    
    // 컬렉션 뷰
    let collectionView :UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return collectionView
    }()
    
    var indexPathSecondCell:IndexPath?
    var indexPathForthCell:IndexPath?

    
    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    // MARK: - configure
    func configure() {
        view.addSubview(topNaviCustom)
        topNaviCustom.translatesAutoresizingMaskIntoConstraints = false
        topNaviCustom.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topNaviCustom.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        topNaviCustom.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        topNaviCustom.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.backgroundColor = .clear
        
        
        topNaviCustom.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.leadingAnchor.constraint(equalTo: topNaviCustom.leadingAnchor, constant: 20).isActive = true
        backButton.centerYAnchor.constraint(equalTo: topNaviCustom.centerYAnchor).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.setImage(#imageLiteral(resourceName: "backButton"), for: .normal)
        backButton.addTarget(self, action: #selector(backEvent(_:)), for: .touchUpInside)
    
        
        
        topNaviCustom.addSubview(stayNaviTitle)
        stayNaviTitle.translatesAutoresizingMaskIntoConstraints = false
        
        stayNaviTitle.centerYAnchor.constraint(equalTo: topNaviCustom.centerYAnchor).isActive = true
        stayNaviTitle.centerXAnchor.constraint(equalTo: topNaviCustom.centerXAnchor).isActive = true
        stayNaviTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
        stayNaviTitle.widthAnchor.constraint(equalTo: topNaviCustom.widthAnchor, multiplier: 0.3).isActive = true
        
        stayNaviTitle.text = "숙소 예약"
        stayNaviTitle.textAlignment = .center
        stayNaviTitle.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        topNaviCustom.addSubview(exitButton)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.trailingAnchor.constraint(equalTo: topNaviCustom.trailingAnchor, constant: -10).isActive = true
        exitButton.centerYAnchor.constraint(equalTo: topNaviCustom.centerYAnchor).isActive = true
        exitButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        exitButton.setImage(UIImage(named: "dismiss"), for: .normal)
        exitButton.addTarget(self, action: #selector(backEvent(_:)), for: .touchUpInside)
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topNaviCustom.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ReservationCollectionFirstViewCell.self, forCellWithReuseIdentifier: "first")
        collectionView.register(ReservationCollectionSecondViewCell.self, forCellWithReuseIdentifier: "second")
        collectionView.register(ReservationCollectionThirdViewCell.self, forCellWithReuseIdentifier: "third")
        collectionView.register(ReservationCollectionForthViewCell.self, forCellWithReuseIdentifier: "forth")

        collectionView.backgroundColor = #colorLiteral(red: 0.8119326234, green: 0.8114410639, blue: 0.8288996816, alpha: 1)
        
    }
    
    // MARK: - Action Method
    @objc private func backEvent(_ sender: UIButton) {
//        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
//        let costomView = UIView()
//        alert.view.addSubview(costomView)
        navigationController?.popViewController(animated: true)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}


extension ReservationViewController :UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "first", for: indexPath) as! ReservationCollectionFirstViewCell
            cell.backgroundColor = .white
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "second", for: indexPath) as! ReservationCollectionSecondViewCell
            cell.backgroundColor = .white
            self.indexPathSecondCell = indexPath
            cell.delegate = self
            
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "third", for: indexPath) as! ReservationCollectionThirdViewCell
            cell.backgroundColor = .white
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "forth", for: indexPath) as! ReservationCollectionForthViewCell
            self.indexPathForthCell = indexPath
            cell.backgroundColor = .white
            cell.delegate = self
            cell.completeDelegate = self
            return cell
        }
        
        
    }
    
    
}

extension ReservationViewController :UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0:
            return CGSize(width: collectionView.frame.width, height: 300)
        case 1:
            return CGSize(width: collectionView.frame.width, height: 300)
        case 2:
            return CGSize(width: collectionView.frame.width, height: 930)
        default:
            return CGSize(width: collectionView.frame.width, height: 420)

        }
    }
}


extension ReservationViewController: checkBoxDelegate {
    func searchButton() {}
    
    func possibleChkButton() {
        guard let indexPath = indexPathSecondCell else {return print("indexPath 오류인가?")}
       let cell = collectionView.cellForItem(at: indexPath) as! ReservationCollectionSecondViewCell
        cell.checkBox.isSelected.toggle()
        
    }
    
}

extension ReservationViewController: ForthCellCheckBoxDelegate {
    func forthCellCheckBox(sender: UIButton) {
        guard let indexPath = indexPathForthCell else {return print("indexPath4번째 셀관련 오류인가?")}
        let cell = collectionView.cellForItem(at: indexPath) as! ReservationCollectionForthViewCell
        if sender == cell.checkButtonAll {
            if !sender.isSelected {
            sender.isSelected = true
            cell.checkButtonCancelProtocolAgree.isSelected = true
            cell.checkButtonPrivacyAgree.isSelected = true
            } else {
                sender.isSelected = false
                cell.checkButtonCancelProtocolAgree.isSelected = false
                cell.checkButtonPrivacyAgree.isSelected = false
            }
        } else {
            sender.isSelected.toggle()
        }
    }
    
}

extension ReservationViewController: ForthCellCompleteDelegate {
    func resultButton(sender: UIButton) {
        guard let indexPath = indexPathForthCell else {return print("indexPath4번째 셀관련 오류인가?")}
        let cell = collectionView.cellForItem(at: indexPath) as! ReservationCollectionForthViewCell
//        reserve(roomNumber: 50, booker: <#T##String#>, phoneNumber: <#T##String#>, wayToGo: <#T##String#>, requestCheckIn: <#T##String#>, requestCheckOut: <#T##String#>, requestHours: <#T##Bool#>, requestDays: <#T##Bool#>, finalPrice: <#T##Int#>, completion: <#T##() -> ()#>)
        
    }
    
    
}
