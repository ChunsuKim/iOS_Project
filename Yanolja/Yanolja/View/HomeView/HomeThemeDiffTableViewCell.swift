//
//  HomeThemeDiffTableViewCell.swift
//  Yanolja
//
//  Created by Chunsu Kim on 18/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomeThemeDiffTableViewCell: UITableViewCell {
    
    static let identifier = "HomeThemeDiffTableViewCell"
    
    private let themeDiffButton = HomeThemeButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        configureThemeDiffButton()
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
    
    private func configureThemeDiffButton() {
        contentView.addSubview(themeDiffButton)
        
        themeDiffButton.translatesAutoresizingMaskIntoConstraints = false
        themeDiffButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        themeDiffButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        themeDiffButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        themeDiffButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        themeDiffButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

}
