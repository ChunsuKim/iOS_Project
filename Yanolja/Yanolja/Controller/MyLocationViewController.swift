//
//  MyLovcationViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 06/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class MyLocationViewController: UIViewController {

    var topNaviView = TopNaviView()
    var listCollectionView = ListCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        
        configureViewComponents()
    }
    
    private func configureViewComponents() {
        view.addSubview(topNaviView)
        view.addSubview(listCollectionView)
        
        listCollectionView.menuTitles = menuTitles
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
    
}

extension MyLocationViewController: checkBoxDelegate {
    func possibleChkButton() {
        if topNaviView.possibleChkButton.isSelected == false {
            topNaviView.possibleChkButton.isSelected = true
        } else {
            topNaviView.possibleChkButton.isSelected = false
        }
    }
    
    func searchButton() {
        let vc = SearchController()
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
}
