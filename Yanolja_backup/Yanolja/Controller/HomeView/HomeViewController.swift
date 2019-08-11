//
//  HomeViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 06/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    private var homeThemeCollectionView = HomeThemeTableViewCell()
    private var homeThemeSecondCollectionView = HomeThemeSecondTableViewCell()
    private var isThemeDiffClicked = true
    private var isSecondThemeDiffClicked = true
    
    // HeaderView
    private let headerView = UIView()
    private let headerImageView = UIImageView()
    private let headerSearchLabel = UILabel()
    private let headerSearchImageView = UIImageView()
    
    // TableView
    private let homeTableView = UITableView()
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        
        configureHeaderView()
        configureTableView()
        
        configureHeaderViewConstraints()
        configureTableViewConstraints()
        
    }
    
    // MARK: - Configuration User Interface
    
    // configuration HeaderView
    private func configureHeaderView() {
        headerView.backgroundColor = #colorLiteral(red: 0.9677450061, green: 0.9726848006, blue: 0.9768208861, alpha: 1)
        
        headerImageView.image = UIImage(named: "logob")
        headerImageView.contentMode = .scaleAspectFit
        
        headerSearchLabel.backgroundColor = .white
        headerSearchLabel.layer.cornerRadius = 17
        headerSearchLabel.clipsToBounds = true
        headerSearchLabel.text = "    어디로 놀러갈까요?"
        headerSearchLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        headerSearchLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        headerSearchImageView.image = UIImage(named: "grasses")
        headerSearchImageView.contentMode = .scaleAspectFill
        
        view.addSubview(headerView)
        headerView.addSubview(headerImageView)
        headerView.addSubview(headerSearchLabel)
        headerSearchLabel.addSubview(headerSearchImageView)
        
    }
    
    // configuration TableView
    private func configureTableView() {
        homeTableView.dataSource = self
        homeTableView.delegate = self
//        homeTableView.estimatedRowHeight = 20  // 대충의 높이값
        homeTableView.rowHeight = UITableView.automaticDimension
        homeTableView.separatorStyle = .none
        homeTableView.backgroundColor = #colorLiteral(red: 0.9677450061, green: 0.9726848006, blue: 0.9768208861, alpha: 1)
        
        homeTableView.register(HomeTopButtonTableViewCell.self, forCellReuseIdentifier: HomeTopButtonTableViewCell.identifier)
        
        homeTableView.register(HomeThemeTableViewCell.self, forCellReuseIdentifier: HomeThemeTableViewCell.identifier)
        
        homeTableView.register(HomeThemeSecondTableViewCell.self, forCellReuseIdentifier: HomeThemeSecondTableViewCell.identifier)
        
        homeTableView.register(HomeThemeDiffTableViewCell.self, forCellReuseIdentifier: HomeThemeDiffTableViewCell.identifier)
        
        homeTableView.register(HomeThemeDiffSecondTableViewCell.self, forCellReuseIdentifier: HomeThemeDiffSecondTableViewCell.identifier)
        
        homeTableView.register(HomePopWordsTableViewCell.self, forCellReuseIdentifier: HomePopWordsTableViewCell.identifier)
        
        homeTableView.register(HomePopTableViewCell.self, forCellReuseIdentifier: HomePopTableViewCell.identifier)
        
        
        view.addSubview(homeTableView)
    }
    
    // MARK: - Configuration Constraints
    
    // HeaderView Constraints
    private func configureHeaderViewConstraints() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20).isActive = true
        headerImageView.topAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.topAnchor).isActive = true
        headerImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        headerImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        headerSearchLabel.translatesAutoresizingMaskIntoConstraints = false
        headerSearchLabel.leadingAnchor.constraint(equalTo: headerImageView.trailingAnchor, constant: 10).isActive = true
        headerSearchLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20).isActive = true
        headerSearchLabel.centerYAnchor.constraint(equalTo: headerImageView.centerYAnchor).isActive = true
        headerSearchLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        headerSearchImageView.translatesAutoresizingMaskIntoConstraints = false
        headerSearchImageView.heightAnchor.constraint(equalToConstant: 17).isActive = true
        headerSearchImageView.widthAnchor.constraint(equalToConstant: 17).isActive = true
        headerSearchImageView.centerYAnchor.constraint(equalTo: headerSearchLabel.centerYAnchor).isActive = true
        headerSearchImageView.trailingAnchor.constraint(equalTo: headerSearchLabel.trailingAnchor, constant: -10).isActive = true
    }
    
    // TableView Constraints
    private func configureTableViewConstraints() {
        homeTableView.translatesAutoresizingMaskIntoConstraints = false
        homeTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        homeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        homeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        homeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: - Action Method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        if headerSearchLabel.frame.contains(touchPoint) {
            let vc = SearchViewController()
            vc.view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.2)

            present(vc, animated: false, completion: nil)
        }
    }
    
    private func isThemeDiffStateToggle() {
        isThemeDiffClicked.toggle()
    }
    
    private func isThemeSecondDiffStateToggle() {
        isSecondThemeDiffClicked.toggle()
    }
}

// MARK: - TableView Data Source Extension
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTopButtonTableViewCell.identifier, for: indexPath) as! HomeTopButtonTableViewCell
            
            cell.buttonsAction = {
                if cell.motelButton.isTouchInside {
                    print("모텔 은석")
                }
                
                if cell.hotelButton.isTouchInside {
                    print("호텔 은석")
                }
                
                if cell.pensionButton.isTouchInside {
                    print("팬션 은석")
                }
                
                if cell.guestButton.isTouchInside {
                    print("게스트 은석")
                }
            }
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeThemeTableViewCell.identifier, for: indexPath) as! HomeThemeTableViewCell
            
            cell.didSelectHandler = {
//                print("collection view click")
                let detailViewController = DetailViewController()
                self.present(detailViewController, animated: true, completion: nil)
            }
            
            homeThemeCollectionView = cell
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeThemeDiffTableViewCell.identifier, for: indexPath) as! HomeThemeDiffTableViewCell
            
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomePopWordsTableViewCell.identifier, for: indexPath) as! HomePopWordsTableViewCell
            
            cell.popInputData(numberOne: keyWords[0].word, numberTwo: keyWords[1].word, numberThree: keyWords[2].word, numberFour: keyWords[3].word, numberFive: keyWords[4].word)
            
            cell.buttonAction = {
                
                cell.popDownButton.isSelected.toggle()
                // FIXME: - If we have time, will fix it
                if cell.popDownButton.isSelected {
                    self.homeTableView.beginUpdates()
                    cell.popBackgroundViewBottomPriority?.isActive = false
                    cell.popHidddenViewBottomPriority?.isActive = true
                    cell.isSelectedHiddenViewState(state: false)
                    self.homeTableView.endUpdates()
                } else {
                    self.homeTableView.beginUpdates()
                    cell.popHidddenViewBottomPriority?.isActive = false
                    cell.popBackgroundViewBottomPriority?.isActive = true
                    cell.isSelectedHiddenViewState(state: true)
                    self.homeTableView.endUpdates()
                }
            }
            
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomePopTableViewCell.identifier, for: indexPath) as! HomePopTableViewCell
            
            cell.collectionViewTouchAction = {
                let popDetailViewController = HomePopDetailViewController()
                self.present(popDetailViewController, animated: true, completion: nil)
            }
            
            return cell
            
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeThemeSecondTableViewCell.identifier, for: indexPath) as! HomeThemeSecondTableViewCell
            
            cell.secondCollectionViewDidSelectHandler = {
                let detailViewController = DetailViewController()
                self.present(detailViewController, animated: true, completion: nil)
            }
            
            homeThemeSecondCollectionView = cell
            
            return cell
            
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeThemeDiffSecondTableViewCell.identifier, for: indexPath) as! HomeThemeDiffSecondTableViewCell
            
            return cell
            
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeThemeTableViewCell.identifier, for: indexPath) as! HomeThemeTableViewCell
            
            cell.reloadTitleLabel(themeTitle: themeTitleFifth, themeTitleDiff: themeTitleSixth)
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - TableView Delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click cell")
        
        switch indexPath.row {
        case 2:
            
            homeThemeCollectionView.reloadCollectionView()
            homeThemeCollectionView.reloadMenuBar()
            homeThemeCollectionView.reloadTitleLabel(themeTitle: themeTitle, themeTitleDiff: themeTitleDiff)
            homeThemeCollectionView.reloadTitleButton()
            isThemeDiffStateToggle()
            if let cell = homeTableView.cellForRow(at: indexPath) as? HomeThemeDiffTableViewCell {
                if isThemeDiffClicked {
                    cell.changePageNumberLabel(currentPageNumber: "1", totalPageNumber: "2")
                } else {
                    cell.changePageNumberLabel(currentPageNumber: "2", totalPageNumber: "2")
                }
            }

        case 6:
            
            homeThemeSecondCollectionView.reloadCollectionView()
            homeThemeSecondCollectionView.reloadMenuBar()
            homeThemeSecondCollectionView.reloadTitleLabel(themeTitle: themeTitleThird, themeTitleDiff: themeTitleFourth)
            homeThemeSecondCollectionView.reloadTitleButton()
            isThemeSecondDiffStateToggle()
            if let cell = homeTableView.cellForRow(at: indexPath) as? HomeThemeDiffSecondTableViewCell {
                if isSecondThemeDiffClicked {
                    cell.changeSecondCollectionViewPageNumberLabel(currentPageNumber: "1", totalPageNumber: "2")
                } else {
                    cell.changeSecondCollectionViewPageNumberLabel(currentPageNumber: "2", totalPageNumber: "2")
                }
            }
            
        default:
            break
        }
    }
}

