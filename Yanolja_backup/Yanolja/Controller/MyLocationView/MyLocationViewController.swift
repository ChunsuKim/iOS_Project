//
//  MyLovcationViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 06/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit
import Alamofire

class MyLocationViewController: UIViewController {
    
    var topNaviView = TopNaviView()
    var listCollectionView = ListCollectionView()
    let notiCenter = NotificationCenter.default
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WebAPI.shared.getTestAPI { [weak self] (listData) in
            self?.reloadCollectionView()
            self?.listCollectionView.listSenderData = listData
        }
        
        navigationController?.isNavigationBarHidden = true
        configureViewComponents()
    }
    override func viewWillAppear(_ animated: Bool) {
        moveDetailVC()
        topNaviView.selectDateButton.setTitle(singleTon.selectDateButtonCurrentTitle, for: .normal)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notiCenter.removeObserver(self)
    }
    
    private func reloadCollectionView() {
        listCollectionView.reloadData()
    }
    
    private func configureViewComponents() {
        view.addSubview(topNaviView)
        view.addSubview(listCollectionView)
        
        listCollectionView.menuTitles = listMenuTitles
        listCollectionView.customMenuBar.menuCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        
        topNaviView.delegate = self
        
        topNaviView.translatesAutoresizingMaskIntoConstraints = false
        listCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            topNaviView.topAnchor.constraint(equalTo: guide.topAnchor),
            topNaviView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            topNaviView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            listCollectionView.topAnchor.constraint(equalTo: topNaviView.bottomAnchor),
            listCollectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            listCollectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            listCollectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            ])
    }
    
    // MARK: - addObserver
    private func moveDetailVC(){
        notiCenter.addObserver(self, selector: #selector(moveDetailEvent(_:)), name: Notification.Name("moveDetailVC"), object: nil)
    }
    
    // MARK: - Action Method
    @objc private func moveDetailEvent(_ sender: Any) {
        let detailVC = DetailViewController()
        
        present(detailVC, animated: true, completion: nil)
    }
    
}

// MARK: - checkBoxDelegate Extension
extension MyLocationViewController: checkBoxDelegate {
    func possibleChkButton() {
        if topNaviView.possibleChkButton.isSelected == false {
            topNaviView.possibleChkButton.isSelected = true
        } else {
            topNaviView.possibleChkButton.isSelected = false
        }
    }
    
    func searchButton() {
        let vc = SearchViewController()
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
    
    func backButton() {
        navigationController?.popViewController(animated: true)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func calendarButton() {
        self.present(CalendarViewController(), animated: true)
    }
    
    func selectPeopleButton() {
        self.present(NumberOfPeopleViewController(), animated: true)
    }
}
