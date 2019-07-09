//
//  CustomTabBarController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 06/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNaviController(viewController: HomeViewController(), title: "홈", imageName: "homed"),
            createNaviController(viewController: RegionViewController(), title: "지역", imageName: "regiond"),
            createNaviController(viewController: MyLovcationViewController(), title: "내주변", imageName: "mylocad"),
            createNaviController(viewController: UserViewController(), title: "MY 야놀자", imageName: "userd")
        ]
    }
    
    private func createNaviController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let naviController = UINavigationController(rootViewController: viewController)
        naviController.tabBarItem.title = title
        naviController.tabBarItem.image = UIImage(named: imageName)
//        naviController.navigationBar.prefersLargeTitles = true
        tabBar.tintColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        return naviController
    }
}
