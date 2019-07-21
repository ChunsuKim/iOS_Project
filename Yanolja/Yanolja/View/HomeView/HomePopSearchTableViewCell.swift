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
    
    let popWordTableView = UITableView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        configurePopWordTableView()
        configurePopWordTableViewConstraints()
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
    
    private func configurePopWordTableView() {
        popWordTableView.dataSource = self
//        popWordTableView.delegate = self
        popWordTableView.estimatedRowHeight = 50
        popWordTableView.rowHeight = UITableView.automaticDimension
        popWordTableView.separatorStyle = .none
        
        popWordTableView.register(HomePopWordsTableViewCell.self, forCellReuseIdentifier: HomePopWordsTableViewCell.identifier)
        
        contentView.addSubview(popWordTableView)
        
    }
    
    private func configurePopWordTableViewConstraints() {
        popWordTableView.translatesAutoresizingMaskIntoConstraints = false
        popWordTableView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        popWordTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        popWordTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        popWordTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}

extension HomePopSearchTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = popWordTableView.dequeueReusableCell(withIdentifier: HomePopWordsTableViewCell.identifier, for: indexPath) as! HomePopWordsTableViewCell
        
        cell.popInputData(numberOne: numberOne, numberTwo: numberTwo, numberThree: numberThree, numberFour: numberFour, numberFive: numberFive)
        
        cell.buttonAction = {

            cell.popDownButton.isSelected.toggle()

            if cell.popDownButton.isSelected {
                UIView.animate(withDuration: 0.3) {
                    self.popWordTableView.beginUpdates()
                    cell.isSelectedHiddenViewState(state: false)
                    cell.popBackgroundViewBottomPriority?.isActive = false
                    cell.popHidddenViewBottomPriority?.isActive = true
                    self.popWordTableView.reloadData()
                    self.popWordTableView.endUpdates()
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.popWordTableView.beginUpdates()
                    cell.isSelectedHiddenViewState(state: true)
                    cell.popBackgroundViewBottomPriority?.isActive = true
                    cell.popHidddenViewBottomPriority?.isActive = false
                    self.popWordTableView.reloadData()
                    self.popWordTableView.endUpdates()
                }
            }
        }
        
        return cell
    }
    
    
}

//extension HomePopSearchTableViewCell: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        if indexPath.row == 0 {
//            if let cell = popWordTableView.cellForRow(at: indexPath) as? HomePopWordsTableViewCell {
//
//
//                cell.buttonAction = {
//
//                    cell.popDownButton.isSelected.toggle()
//
//                    if cell.popDownButton.isSelected {
//                        UIView.animate(withDuration: 0.3) {
//                            //                    self.popWordTableView.beginUpdates()
//                            cell.isSelectedHiddenViewState(state: false)
//                            cell.popBackgroundViewBottomPriority?.isActive = false
//                            cell.popHidddenViewBottomPriority?.isActive = true
//                            self.popWordTableView.reloadData()
//                            //                    self.popWordTableView.endUpdates()
//                        }
//                    } else {
//                        UIView.animate(withDuration: 0.3) {
//                            //                    self.popWordTableView.beginUpdates()
//                            cell.isSelectedHiddenViewState(state: true)
//                            cell.popBackgroundViewBottomPriority?.isActive = true
//                            cell.popHidddenViewBottomPriority?.isActive = false
//                            self.popWordTableView.reloadData()
//                            //                    self.popWordTableView.endUpdates()
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
