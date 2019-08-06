//
//  RecentlyCustomCell.swift
//  Yanolja
//
//  Created by brian은석 on 19/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

protocol RemoveCell {
    func removeCell(sender:UIButton)
}


class RecentlyCustomCell: UITableViewCell {
    let customImageView = UIImageView()
    var searchResultLabel = UILabel()
    var dateLabel = UILabel()
    var numberOfPeopleLabel = UILabel()
    var cancel = UIButton(type: .system)
    
    
    var search :SearchClass? {
        didSet {
            guard let search = self.search else {return}
            searchResultLabel.text = search.searchPointNameLabel
            dateLabel.text = search.dateLabel
            numberOfPeopleLabel.text = search.numberOfPeopleLabel
        }
    }
    
    var delegate :RemoveCell?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        self.selectionStyle = .none
        featUI()
    }
    func configureUI() {
        let temp = [customImageView,searchResultLabel,dateLabel,numberOfPeopleLabel,cancel]
        for x in temp {
            self.addSubview(x)
            x.translatesAutoresizingMaskIntoConstraints = false
        }
        customImageView.topAnchor.constraint(equalTo: self.topAnchor,constant: 7).isActive = true
        customImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 5).isActive = true
        customImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        customImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        customImageView.image = UIImage(named: "cellIcon")
        
        cancel.topAnchor.constraint(equalTo: self.topAnchor,constant: 5).isActive = true
        cancel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -5).isActive = true
        cancel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        cancel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        cancel.contentMode = .scaleAspectFill
        cancel.setImage(#imageLiteral(resourceName: "dismisslog"), for: .normal)
        cancel.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cancel.addTarget(self, action: #selector(cellRemove(sender:)), for: .touchUpInside)
        
        searchResultLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 5).isActive = true
        searchResultLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor,constant: 10).isActive = true
        searchResultLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 60).isActive = true
        searchResultLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: searchResultLabel.bottomAnchor,constant: 5).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor,constant: 10).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 60).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        numberOfPeopleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor,constant: 5).isActive = true
        numberOfPeopleLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor,constant: 10).isActive = true
        numberOfPeopleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 60).isActive = true
        numberOfPeopleLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        numberOfPeopleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5).isActive = true
        
    }
    private func featUI() {
        searchResultLabel.font = UIFont.systemFont(ofSize: 15)
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        dateLabel.textColor = .lightGray
        numberOfPeopleLabel.font = UIFont.systemFont(ofSize: 12)
        numberOfPeopleLabel.textColor = .lightGray

        
    }
    
    @objc private func cellRemove(sender:UIButton) {
        delegate?.removeCell(sender: sender)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
