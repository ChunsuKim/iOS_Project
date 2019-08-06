//
//  HomeThemeDiffSecondTableViewCell.swift
//  Yanolja
//
//  Created by Chunsu Kim on 07/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomeThemeDiffSecondTableViewCell: UITableViewCell {

    // MARK: - Properties
    static let identifier = "HomeThemeDiffSecondTableViewCell"
    
    private let themeDiffSecondButton = HomeThemeButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        configureThemeDiffButton()
        configureDefaltPageNumber()
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
    
    // MARK: - Configuration
    private func configureDefaltPageNumber() {
        themeDiffSecondButton.currentPageNumberLabel.text = "1"
        themeDiffSecondButton.totalPageNumberLabel.text = "2"
    }
    
    private func configureThemeDiffButton() {
        contentView.addSubview(themeDiffSecondButton)
        
        themeDiffSecondButton.translatesAutoresizingMaskIntoConstraints = false
        themeDiffSecondButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        themeDiffSecondButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        themeDiffSecondButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        themeDiffSecondButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        themeDiffSecondButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    // MARK: - Value setting global method
    func changeSecondCollectionViewPageNumberLabel(currentPageNumber: String, totalPageNumber: String) {
        themeDiffSecondButton.currentPageNumberLabel.text = currentPageNumber
        themeDiffSecondButton.totalPageNumberLabel.text = totalPageNumber
    }
    
}
