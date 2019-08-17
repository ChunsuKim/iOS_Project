//
//  FilterThemeCell.swift
//  Yanolja
//
//  Created by brian은석 on 12/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class FilterThemeCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    var count = 0 {
        didSet{
            let titleText = "\(self.count)개 선택"
            let privacyAgreeAttributedString: NSMutableAttributedString = NSMutableAttributedString(string: titleText)
            privacyAgreeAttributedString.setColorForText(textForAttribute: "\(self.count)", withColor: .red)
            privacyAgreeAttributedString.setFontForText(textForAttribute: "\(self.count)", withFont: UIFont.systemFont(ofSize: 16, weight: .bold))
            privacyAgreeAttributedString.setColorForText(textForAttribute: "개 선택", withColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            privacyAgreeAttributedString.setFontForText(textForAttribute: "개 선택", withFont: UIFont.systemFont(ofSize: 16, weight: .bold))
            numberOfSelection.attributedText = privacyAgreeAttributedString
        }
    }
    let numberOfSelection = UILabel()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeView()
        self.selectionStyle = .none

    }
    
    private func makeView() {
        let tempArr = [titleLabel,numberOfSelection,collectionView]
            tempArr.forEach{
                self.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 40).isActive = true
        titleLabel.text = "테마"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        
        numberOfSelection.topAnchor.constraint(equalTo: self.topAnchor,constant: 20).isActive = true
        numberOfSelection.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -40).isActive = true
        let titleText = "\(count)개 선택"
        let privacyAgreeAttributedString: NSMutableAttributedString = NSMutableAttributedString(string: titleText)
        privacyAgreeAttributedString.setColorForText(textForAttribute: "\(count)", withColor: .red)
        privacyAgreeAttributedString.setFontForText(textForAttribute: "\(count)", withFont: UIFont.systemFont(ofSize: 16, weight: .bold))
        privacyAgreeAttributedString.setColorForText(textForAttribute: "개 선택", withColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        privacyAgreeAttributedString.setFontForText(textForAttribute: "개 선택", withFont: UIFont.systemFont(ofSize: 16, weight: .bold))
        numberOfSelection.attributedText = privacyAgreeAttributedString
        
        collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 5).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor ).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor ).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 230).isActive = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FilterThemeCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension FilterThemeCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FilterThemeCollectionViewCell
        let image = #imageLiteral(resourceName: "airplane").withRenderingMode(.alwaysTemplate)
        cell.button.setImage(image, for: .normal)
        cell.button.tintColor = #colorLiteral(red: 0.7348349094, green: 0.7389728427, blue: 0.7457159162, alpha: 1)
        cell.collectionViewCellTitleLabel.text = "세탁기"
        cell.delegate = self
        return cell
    }
    
    
}

extension FilterThemeCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width-30)/6
        let height = (collectionView.frame.height - 55)/2
        
        return CGSize(width: width.rounded(.down), height: height.rounded(.down))
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 30, bottom: 30, right: 0)
    }
   
}

extension FilterThemeCell: CountDelegate {
    func plusCount(count: Int) {
        self.count += count
    }
}
