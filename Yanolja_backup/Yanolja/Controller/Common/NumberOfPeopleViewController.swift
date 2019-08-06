//
//  NumberOfPeopleViewController.swift
//  Yanolja
//
//  Created by brian은석 on 24/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class NumberOfPeopleViewController: UIViewController {
    
    // MARK: - properties
    let mainView = UIView()
    let backButton = UIButton()
    let mainTitleLabel = UILabel()
    let warningLabel = UILabel()
    let warningBoldFontLabel = UILabel()
    let frameView = UIView()
    var frameViewheightAnchor :NSLayoutConstraint?
    var frmaeViewheightAnimateAnchor :NSLayoutConstraint?
    // adult
    let adultLabel = UILabel()
    let adultPlusButton = UIButton()
    let numberOfAdultLabel = UILabel()
    let adultMinusButton = UIButton()
    var adultCount = 2
    
    // childLabel
    let childLabel = UILabel()
    let childPlusButton = UIButton()
    let numberOfchildLabel = UILabel()
    let childMinusButton = UIButton()
    var childCount = 0
    
    //caution View
    let cautionImageView = UIImageView()
    let cautionLabel = UILabel()
    
    // child collectionView
    var collectionView :UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 0, left: Metric.leftContentInset, bottom: 0, right: 0)
        return collectionView
    }()
    
    
    // resultButton
    
    let resultButton = UIButton()
    lazy var resultButtonSetTitle = resultButton.currentTitle
    
    // pickerView
    let pickerValue = ["만 1세 미만","만 2세","만 3세","만 4세","만 5세","만 6세","만 7세","만 8세","만 9세","만 10세","만 11세","만 12세","만 13세","만 14세","만 15세","만 16세","만 17세"]
    
    var pickerView = UIPickerView()
    var saveAge = ""
    var maxRow = 0
    
    
    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.2)
        
        configureUI()
    }
    
    // MARK: - Configure Constraints
    private func configureUI() {
        let buttonSize:CGFloat = 20
        
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainView.isUserInteractionEnabled = true
        //코너 라디우스 위만 주기.
        mainView.layer.cornerRadius = 20
        mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        mainView.backgroundColor = .white
        
        mainView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: mainView.topAnchor,constant: UISetting.topPadding.rawValue - 3).isActive = true
        backButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 20).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.setImage(UIImage(named: "dismiss"), for: .normal)
        backButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        
        
        
        mainView.addSubview(mainTitleLabel)
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainTitleLabel.lastBaselineAnchor.constraint(equalTo: backButton.lastBaselineAnchor).isActive = true
        mainTitleLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor).isActive = true
        mainTitleLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        mainTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mainTitleLabel.text = "인원수 선택"
        mainTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        
        
        mainView.addSubview(warningLabel)
        warningLabel.translatesAutoresizingMaskIntoConstraints = false
        warningLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 25).isActive = true
        warningLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor).isActive = true
        warningLabel.text = "정확한 숙소검색 결과를 확인하려면"
        warningLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        
        mainView.addSubview(warningBoldFontLabel)
        warningBoldFontLabel.translatesAutoresizingMaskIntoConstraints = false
        warningBoldFontLabel.topAnchor.constraint(equalTo: warningLabel.bottomAnchor).isActive = true
        warningBoldFontLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor).isActive = true
        warningBoldFontLabel.text = "인원수를 선택해 주세요."
        warningBoldFontLabel.font = UIFont.boldSystemFont(ofSize: 13)
        
        mainView.addSubview(frameView)
        frameView.translatesAutoresizingMaskIntoConstraints = false
        frameView.topAnchor.constraint(equalTo: warningBoldFontLabel.bottomAnchor,constant: 13).isActive = true
        frameView.leadingAnchor.constraint(equalTo: backButton.leadingAnchor).isActive = true
        frameView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -20).isActive = true
        
        frameViewheightAnchor = frameView.heightAnchor.constraint(equalToConstant: 100)
        frameViewheightAnchor?.priority = .init(350)
        frameViewheightAnchor?.isActive = true
        
        frmaeViewheightAnimateAnchor = frameView.heightAnchor.constraint(equalToConstant: 250)
        frmaeViewheightAnimateAnchor?.priority = .defaultLow
        frmaeViewheightAnimateAnchor?.isActive = true
        
        frameView.layer.borderColor = #colorLiteral(red: 0.8814956546, green: 0.8863850236, blue: 0.8905579448, alpha: 1)
        frameView.layer.borderWidth = 1
        frameView.layer.cornerRadius = 10
        
        
        mainView.addSubview(adultLabel)
        adultLabel.translatesAutoresizingMaskIntoConstraints = false
        adultLabel.topAnchor.constraint(equalTo: frameView.topAnchor,constant: 20).isActive = true
        adultLabel.leadingAnchor.constraint(equalTo: frameView.leadingAnchor,constant: 15).isActive = true
        adultLabel.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        adultLabel.text = "성인"
        adultLabel.font = UIFont.systemFont(ofSize: 14)
        
        mainView.addSubview(adultPlusButton)
        adultPlusButton.translatesAutoresizingMaskIntoConstraints = false
        adultPlusButton.topAnchor.constraint(equalTo: frameView.topAnchor,constant: 20).isActive = true
        adultPlusButton.trailingAnchor.constraint(equalTo: frameView.trailingAnchor,constant: -15).isActive = true
        adultPlusButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        adultPlusButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        adultPlusButton.setImage(UIImage(named: "plus"), for: .normal)
        adultPlusButton.addTarget(self, action: #selector(plus), for: .touchUpInside)
        
        mainView.addSubview(numberOfAdultLabel)
        numberOfAdultLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfAdultLabel.topAnchor.constraint(equalTo: frameView.topAnchor,constant: 20).isActive = true
        numberOfAdultLabel.trailingAnchor.constraint(equalTo: adultPlusButton.leadingAnchor).isActive = true
        numberOfAdultLabel.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        numberOfAdultLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        numberOfAdultLabel.text = "\(adultCount)"
        numberOfAdultLabel.textAlignment = .center
        
        mainView.addSubview(adultMinusButton)
        adultMinusButton.translatesAutoresizingMaskIntoConstraints = false
        adultMinusButton.centerYAnchor.constraint(equalTo: numberOfAdultLabel.centerYAnchor).isActive = true
        //        adultMinusButton.topAnchor.constraint(equalTo: frameView.topAnchor,constant: 20).isActive = true
        adultMinusButton.trailingAnchor.constraint(equalTo: numberOfAdultLabel.leadingAnchor).isActive = true
        adultMinusButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        adultMinusButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        adultMinusButton.setImage(UIImage(named: "minus"), for: .normal)
        adultMinusButton.setImage(UIImage(named: "minusGRAY"), for: .disabled)
        adultMinusButton.addTarget(self, action: #selector(minus(sender:)), for: .touchUpInside)
        
        
        mainView.addSubview(childLabel)
        childLabel.translatesAutoresizingMaskIntoConstraints = false
        childLabel.topAnchor.constraint(equalTo: adultLabel.bottomAnchor,constant: 20).isActive = true
        childLabel.leadingAnchor.constraint(equalTo: frameView.leadingAnchor,constant: 15).isActive = true
        //        childLabel.bottomAnchor.constraint(equalTo: frameView.bottomAnchor,constant: -20).isActive = true
        childLabel.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        childLabel.text = "아동"
        childLabel.font = UIFont.systemFont(ofSize: 14)
        
        
        mainView.addSubview(childPlusButton)
        childPlusButton.translatesAutoresizingMaskIntoConstraints = false
        childPlusButton.topAnchor.constraint(equalTo: adultLabel.bottomAnchor,constant: 20).isActive = true
        childPlusButton.trailingAnchor.constraint(equalTo: frameView.trailingAnchor,constant: -15).isActive = true
        childPlusButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        childPlusButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        childPlusButton.setImage(UIImage(named: "plus"), for: .normal)
        childPlusButton.addTarget(self , action: #selector(plus(sender:)), for: .touchUpInside)
        
        mainView.addSubview(numberOfchildLabel)
        numberOfchildLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfchildLabel.topAnchor.constraint(equalTo: adultLabel.bottomAnchor,constant: 20).isActive = true
        numberOfchildLabel.trailingAnchor.constraint(equalTo: childPlusButton.leadingAnchor).isActive = true
        numberOfchildLabel.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        numberOfchildLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        numberOfchildLabel.text = "\(childCount)"
        numberOfchildLabel.textAlignment = .center
        
        mainView.addSubview(childMinusButton)
        childMinusButton.translatesAutoresizingMaskIntoConstraints = false
        childMinusButton.topAnchor.constraint(equalTo: adultLabel.bottomAnchor,constant: 20).isActive = true
        childMinusButton.trailingAnchor.constraint(equalTo: numberOfchildLabel.leadingAnchor).isActive = true
        childMinusButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        childMinusButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        childMinusButton.setImage(UIImage(named: "minus"), for: .normal)
        childMinusButton.addTarget(self, action: #selector(minus(sender:)), for: .touchUpInside)
        childMinusButton.isEnabled = false
        childMinusButton.setImage(UIImage(named: "minusGRAY"), for: .disabled)
        
        
        view.addSubview(cautionImageView)
        cautionImageView.translatesAutoresizingMaskIntoConstraints = false
        cautionImageView.topAnchor.constraint(equalTo: childLabel.bottomAnchor,constant: 25).isActive = true
        cautionImageView.leadingAnchor.constraint(equalTo: childLabel.leadingAnchor).isActive = true
        cautionImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        cautionImageView.image = UIImage(named: "caution")
        cautionImageView.isHidden = true
        
        view.addSubview(cautionLabel)
        cautionLabel.translatesAutoresizingMaskIntoConstraints = false
        cautionLabel.topAnchor.constraint(equalTo: childLabel.bottomAnchor,constant: 25).isActive = true
        cautionLabel.leadingAnchor.constraint(equalTo: cautionImageView.trailingAnchor,constant: 5).isActive = true
        cautionLabel.trailingAnchor.constraint(equalTo: frameView.trailingAnchor,constant: -25).isActive = true
        cautionLabel.text = "아동의 입실여부와 추가요금은 숙소마다 상이하므로 예약시 안내사항을 참고해주세요."
        cautionLabel.numberOfLines = 2
        cautionLabel.font = UIFont.systemFont(ofSize: 12)
        cautionLabel.textColor = UIColor.gray
        cautionLabel.isHidden = true
        
        frameView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: cautionLabel.bottomAnchor,constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: frameView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: frameView.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        collectionView.isHidden = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(NumberOfPeopleCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.indicatorStyle = .white
        
        mainView.addSubview(resultButton)
        resultButton.translatesAutoresizingMaskIntoConstraints = false
        resultButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20).isActive = true
        resultButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant:20 ).isActive = true
        resultButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true
        resultButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        resultButton.setTitle("성인 \(adultCount), 아동 \(childCount)▪︎적용하기", for: .normal)
        resultButton.setTitleColor(.white, for: .normal)
        resultButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        resultButton.layer.cornerRadius = 20
        resultButton.backgroundColor = #colorLiteral(red: 0.8658382297, green: 0.1847263575, blue: 0.3746792078, alpha: 1)
        resultButton.addTarget(self, action: #selector(okAction), for: .touchUpInside)
    }
    
    // MARK: - Action Method
    @objc private func minus(sender:UIButton) {
        if sender == childMinusButton {
            if childCount > 0 {
                childCount -= 1
                numberOfchildLabel.text = "\(childCount)"
                
                collectionView.reloadData()
            }
            if childCount == 0 {
                print("childCount :",childCount)
                childMinusButton.isEnabled = false
                cautionLabel.isHidden = true
                cautionImageView.isHidden = true
                collectionView.isHidden = true
                frmaeViewheightAnimateAnchor?.priority = .defaultLow
                self.resultButton.backgroundColor = #colorLiteral(red: 0.8658382297, green: 0.1847263575, blue: 0.3746792078, alpha: 1)
                self.resultButton.isEnabled = true
                self.view.layoutIfNeeded()
                collectionView.reloadData()
                
            }
            
        } else {
            if adultCount > 1 {
                adultCount -= 1
                numberOfAdultLabel.text = "\(adultCount)"
            }
            if adultCount == 1 {
                adultMinusButton.isEnabled = false
            }
        }
        resultButton.setTitle("성인 \(adultCount), 아동 \(childCount)▪︎적용하기", for: .normal)
    }
    
    @objc private func plus(sender:UIButton) {
        if sender == childPlusButton {
            childMinusButton.isEnabled = true
            
            if childCount < 8 {
                childCount += 1
                self.resultButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                self.resultButton.isEnabled = false
                numberOfchildLabel.text = "\(childCount)"
                
                frmaeViewheightAnimateAnchor?.priority = .defaultHigh
                view.layoutIfNeeded()
                cautionLabel.isHidden = false
                cautionImageView.isHidden = false
                collectionView.isHidden = false
                collectionView.reloadData()
                
            }
        } else {
            adultMinusButton.isEnabled = true
            if adultCount < 8 {
                adultCount += 1
                numberOfAdultLabel.text = "\(adultCount)"
            }
        }
        resultButton.setTitle("성인 \(adultCount), 아동 \(childCount)▪︎적용하기", for: .normal)
        
    }
    @objc private func dismissAction() {
        dismiss(animated: true, completion: nil) }
    
    @objc private func okAction() {
        let vc = presentingViewController as! SearchViewController
        vc.numberOfPeopleLabel.text = "성인 \(adultCount), 아동 \(childCount)"
        vc.numberOfPeopleLabel.font = UIFont.systemFont(ofSize: 15, weight: .ultraLight)
        vc.saveStringNumberOfAdult = adultCount
        vc.saveStringNumberOfKids = childCount

        dismissAction()
    }
    
    enum Metric {
        static let lineSpacing: CGFloat = 3
        static let leftContentInset: CGFloat = 15
        static let numberOfLine: CGFloat = 3.5
        static let inset: UIEdgeInsets = .init(top: 0, left: 6, bottom: 5, right: 0)
        static var horizontalPadding: CGFloat {
            return Metric.inset.left + Metric.inset.right
        }
    }
    
    
    
}


extension NumberOfPeopleViewController :UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NumberOfPeopleCollectionViewCell
        cell.layer.borderWidth = 2
        cell.layer.borderColor = #colorLiteral(red: 0.8936626315, green: 0.8977844715, blue: 0.900680244, alpha: 1)
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 8
        cell.titleLabel.text = "아동 \(indexPath.row + 1)"
        
        return cell
    }
    
    
}

extension NumberOfPeopleViewController :UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lineSpacing = Metric.lineSpacing * (Metric.numberOfLine - 1).rounded(.up)
        let horizontalPadding = Metric.horizontalPadding + Metric.leftContentInset
        
        let width = (collectionView.frame.width - lineSpacing - horizontalPadding) / Metric.numberOfLine
        
        return CGSize(width: width.rounded(.down), height: collectionView.frame.height.rounded(.down))
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("선택한 아이템의 로우",indexPath.row)
        if indexPath.row > maxRow {
            maxRow = indexPath.row
        }
        
        let alert = UIAlertController(title: "나이선택", message: "\n\n\n\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet)
        alert.view.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor,constant: -50).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor).isActive = true
        pickerView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        alert.isModalInPopover = true
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        
        
        alert.addAction(UIAlertAction(title: "선택", style: .default,
                                      handler: { (alert) in
                                        let numberOfCell = collectionView.cellForItem(at: indexPath) as! NumberOfPeopleCollectionViewCell
                                        numberOfCell.ageOfLabel.text = "\(self.saveAge)"
                                        var count = -1
                                        for _ in 0...self.maxRow {
                                            if numberOfCell.ageOfLabel.text != "나이 선택" {
                                                count += 1
                                            }
                                        }
                                        if count == self.maxRow {
                                            self.resultButton.backgroundColor = #colorLiteral(red: 0.8658382297, green: 0.1847263575, blue: 0.3746792078, alpha: 1)
                                            self.resultButton.isEnabled = true
                                        } else {
                                            self.resultButton.isEnabled = false
                                            self.resultButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                                        }
                                        
        }))
        self.present(alert, animated: false, completion: nil)
    }
    
}

extension NumberOfPeopleViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerValue.count
    }
    
    
}

extension NumberOfPeopleViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerValue[row]
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return CGFloat(55)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        saveAge = pickerValue[row]
        
    }
    
    
}
