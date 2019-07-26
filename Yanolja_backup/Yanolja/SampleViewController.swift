//
//  SampleViewController.swift
//  Yanolja
//
//  Created by Chunsu Kim on 25/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController {
    
    // MARK: - Properties
    private let sampleImageView = UIImageView()
    private let sampleLabel = UILabel()
    private let sampleButton = UIButton(type: .custom)
    
    private let sampleTableView = UITableView()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
        configureTableView()
        configureConstraints()
    }
    
    // MARK: - Configuration
    private func configureViews() {
        view.addSubview(sampleImageView)
        view.addSubview(sampleLabel)
        view.addSubview(sampleButton)
        
        sampleImageView.image = UIImage(named: "star")
        sampleImageView.contentMode = .scaleAspectFit
        
        sampleLabel.text = "Sample Code Organizing"
        sampleLabel.textColor = #colorLiteral(red: 0.5239329934, green: 0.562708199, blue: 1, alpha: 1)
        sampleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        sampleButton.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        sampleButton.backgroundColor = .lightGray
    }
    
    private func configureTableView() {
        sampleTableView.dataSource = self
        sampleTableView.delegate = self
        
        sampleTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(sampleTableView)
    }
    
    // MARK: - Configure Constraints
    private func configureConstraints() {
        sampleImageView.translatesAutoresizingMaskIntoConstraints = false
        sampleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sampleImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        sampleImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        sampleImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        sampleLabel.translatesAutoresizingMaskIntoConstraints = false
        sampleLabel.centerXAnchor.constraint(equalTo: sampleImageView.centerXAnchor).isActive = true
        sampleLabel.topAnchor.constraint(equalTo: sampleImageView.bottomAnchor).isActive = true
        sampleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        sampleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        sampleButton.translatesAutoresizingMaskIntoConstraints = false
        sampleButton.centerXAnchor.constraint(equalTo: sampleLabel.centerXAnchor).isActive = true
        sampleButton.topAnchor.constraint(equalTo: sampleLabel.bottomAnchor).isActive = true
        sampleButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        sampleButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        sampleTableView.translatesAutoresizingMaskIntoConstraints = false
        sampleTableView.topAnchor.constraint(equalTo: sampleButton.bottomAnchor).isActive = true
        sampleTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        sampleTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        sampleTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: - Global Method
    func configureInputValue(text: String, image: UIImage?) {
        sampleLabel.text = text
        sampleImageView.image = image
    }
    
    // MARK: - Action Method
    @objc private func buttonDidTap(_ sender: UIButton) {
        print("button DidTap")
    }
}

// MARK: - TableView DataSource
extension SampleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        
        return cell
    }
    
    
}

// MARK: - TableView Delegate
extension SampleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Sample ViewController")
    }
}
