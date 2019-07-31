//
//  RecentlyCell.swift
//  appStorePrac
//
//  Created by brian은석 on 10/07/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class RecentlyCell: UITableViewCell {

    @IBOutlet weak var searchResultLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var cancel: UIButton!
    
    
    var search :SearchClass? {
        didSet {
            guard let search = self.search else {return}
            searchResultLabel.text = search.searchPointNameLabel
            dateLabel.text = search.dateLabel
            numberOfPeopleLabel.text = search.numberOfPeopleLabel
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
