//
//  RecentlyCustomCell.swift
//  Yanolja
//
//  Created by brian은석 on 19/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class RecentlyCustomCell: UITableViewCell {
    let customImageView = UIImageView()
    var searchResultLabel = UILabel()
    var dateLabel = UILabel()
    var numberOfPeopleLabel = UILabel()
    var cancel = UIButton()
    
    
    var search :SearchClass? {
        didSet {
            guard let search = self.search else {return}
            searchResultLabel.text = search.searchPointNameLabel
            dateLabel.text = search.dateLabel
            numberOfPeopleLabel.text = search.numberOfPeopleLabel
        }
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
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
    func featUI() {
        searchResultLabel.font = UIFont.systemFont(ofSize: 15)
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        dateLabel.textColor = .lightGray
        numberOfPeopleLabel.font = UIFont.systemFont(ofSize: 12)
        numberOfPeopleLabel.textColor = .lightGray

        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
