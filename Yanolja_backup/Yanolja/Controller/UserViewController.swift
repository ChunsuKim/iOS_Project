//
//  UserViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 06/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    // MARK: - Properties
    private let userViewTableView = UITableView()
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUserViewTableView()
    }
    
    // MARK: - Configuration
    private func configureUserViewTableView() {
     
        userViewTableView.estimatedRowHeight = 50
        userViewTableView.rowHeight = UITableView.automaticDimension
        userViewTableView.dataSource = self
        userViewTableView.delegate = self
        
        userViewTableView.register(UserViewLoginTableViewCell.self, forCellReuseIdentifier: UserViewLoginTableViewCell.identifier)
        userViewTableView.register(UserViewLoginStampTableViewCell.self, forCellReuseIdentifier: UserViewLoginStampTableViewCell.identifier)
        
        view.addSubview(userViewTableView)
        
        userViewTableView.translatesAutoresizingMaskIntoConstraints = false
        userViewTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        userViewTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        userViewTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        userViewTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    

}

// MARK: - TableView DataSource
extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = userViewTableView.dequeueReusableCell(withIdentifier: UserViewLoginTableViewCell.identifier, for: indexPath) as? UserViewLoginTableViewCell {
            
            switch indexPath.row {
            case 0:
                cell.configureInputValue(text: "로그인 및 회원가입", textColor: #colorLiteral(red: 0.9960784314, green: 0.2039215686, blue: 0.4705882353, alpha: 1), image: nil)
                cell.separatorInset = UIEdgeInsets(top: 0, left: view.frame.midX, bottom: 0, right: view.frame.midX)
                
            case 1:
                if let stampCell = userViewTableView.dequeueReusableCell(withIdentifier: UserViewLoginStampTableViewCell.identifier, for: indexPath) as? UserViewLoginStampTableViewCell {
                    
                    stampCell.configureStampImageInput(image: UIImage(named: "stamp"))
                    stampCell.separatorInset = UIEdgeInsets(top: 0, left: view.frame.midX, bottom: 0, right: view.frame.midX)
                    
                    return stampCell
                }
                
            case 2:
                if let couponCell = userViewTableView.dequeueReusableCell(withIdentifier: UserViewLoginStampTableViewCell.identifier, for: indexPath) as? UserViewLoginStampTableViewCell {
                    
                    couponCell.configureStampImageInput(image: UIImage(named: "couponregister"))
                    couponCell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
                    return couponCell
                }
                
            case 3:
                cell.configureInputValue(text: "비회원 국내숙소 예약조회", textColor: .black, image: UIImage(named: "right"))
                cell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
                
            case 4:
                cell.configureInputValue(text: "비회원 해외숙소 예약조회", textColor: .black, image: UIImage(named: "right"))
                cell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
                
            case 5:
                cell.configureInputValue(text: "비회원 레저/티켓 구매내역", textColor: .black, image: UIImage(named: "right"))
                cell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
                
            default:
                cell.configureInputValue(text: "default", textColor: .black, image: nil)
            }
            
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - TableView Delegate
extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let loginViewController = LoginViewController()
        
        switch indexPath.row {
        case 0:
            present(loginViewController, animated: true, completion: nil)
            
        default:
            break
        }
    }
}
