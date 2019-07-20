//
//  HomePopSearchTableViewCell.swift
//  Yanolja
//
//  Created by Chunsu Kim on 21/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomePopSearchTableViewCell: UITableViewCell {
    
    static let identifier = "HomePopSearchTableViewCell"
    
    private let popNowdaysLabel = UILabel()
    private let popUpArrowImageView = UIImageView()
    
    private let popLabelStackView = UIStackView()
    private let popNumberLabel = UILabel()
    private let popStringLabel = UILabel()
    
    private let popDownImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        configureViews()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureViews() {
        popNowdaysLabel.textColor = #colorLiteral(red: 0.9968286157, green: 0.20554322, blue: 0.4714341164, alpha: 1)
        popNowdaysLabel.text = "요즘 뜨는"
        popNowdaysLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        popUpArrowImageView.image = #imageLiteral(resourceName: "pop")
        popUpArrowImageView.contentMode = .scaleAspectFit
        
        popLabelStackView.axis = .horizontal
        popLabelStackView.distribution = .fillProportionally
        popLabelStackView.spacing = 5
        
        popNumberLabel.text = "1"
        popNumberLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        popStringLabel.text = "서울호캉스"
        popStringLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        popDownImageView.image = #imageLiteral(resourceName: "down")
        popDownImageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(popNowdaysLabel)
        contentView.addSubview(popUpArrowImageView)
        contentView.addSubview(popLabelStackView)
        popLabelStackView.addArrangedSubview(popNumberLabel)
        popLabelStackView.addArrangedSubview(popStringLabel)
        contentView.addSubview(popDownImageView)
    }
    
    private func configureConstraints() {
        popNowdaysLabel.translatesAutoresizingMaskIntoConstraints = false
        popNowdaysLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        popNowdaysLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        popNowdaysLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        popNowdaysLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        popUpArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        popUpArrowImageView.leadingAnchor.constraint(equalTo: popNowdaysLabel.trailingAnchor).isActive = true
        popUpArrowImageView.centerYAnchor.constraint(equalTo: popNowdaysLabel.centerYAnchor).isActive = true
        popUpArrowImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        popUpArrowImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        popLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        popLabelStackView.leadingAnchor.constraint(equalTo: popUpArrowImageView.trailingAnchor, constant: 15).isActive = true
        popLabelStackView.trailingAnchor.constraint(equalTo: popDownImageView.leadingAnchor).isActive = true
        popLabelStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        popLabelStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        popLabelStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        popNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        popNumberLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        popNumberLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        popStringLabel.translatesAutoresizingMaskIntoConstraints = false
        popStringLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        popStringLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        popDownImageView.translatesAutoresizingMaskIntoConstraints = false
        popDownImageView.centerYAnchor.constraint(equalTo: popNowdaysLabel.centerYAnchor).isActive = true
        popDownImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        popDownImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        popDownImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

}
