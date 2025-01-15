//
//  CheckViewController.swift
//  CafeManager
//
//  Created by Alexandr on 14/01/2025.
//  Copyright © 2025 Alexandr. All rights reserved.
//

import UIKit

class CheckViewController: UIViewController {
    
    private let nameTitle1: UILabel = {
        let label = UILabel()
        label.text = "Салат Цезарь"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private let underNameTitle1: UILabel = {
        let label = UILabel()
        label.text = "Помидор, салат айсберг, сухарики, курица"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private let priceLabel1: UILabel = {
        let label = UILabel()
        label.text = "400 р  >"
        label.textColor = .lightGray
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let separator1: UIView = {
        let separator = UIView()
        separator.backgroundColor = .lightGray
        return separator
    }()
    
    private let nameTitle2: UILabel = {
        let label = UILabel()
        label.text = "Салат Греческий"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private let underNameTitle2: UILabel = {
        let label = UILabel()
        label.text = "Помидор, салат айсберг, сухарики"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private let priceLabel2: UILabel = {
        let label = UILabel()
        label.text = "300 р  >"
        label.textColor = .lightGray
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let separator2: UIView = {
        let separator = UIView()
        separator.backgroundColor = .lightGray
        return separator
    }()
    
    private let priceButton: UIButton = {
        let button = UIButton()
        button.setTitle("Итого : 700р", for: .normal)
        button.backgroundColor = .systemGreen
        button.tintColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Чек"
        setupLayout()
    }
    
    private func setupLayout() {
        [separator1, nameTitle1, underNameTitle1, priceLabel1, separator2, nameTitle2, underNameTitle2, priceLabel2, priceButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
            NSLayoutConstraint.activate([
                
                nameTitle1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                nameTitle1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
                
                priceLabel1.trailingAnchor.constraint(equalTo: separator1.trailingAnchor),
                priceLabel1.centerYAnchor.constraint(equalTo: nameTitle1.centerYAnchor),
                
                underNameTitle1.leadingAnchor.constraint(equalTo: nameTitle1.leadingAnchor),
                underNameTitle1.topAnchor.constraint(equalTo: nameTitle1.bottomAnchor, constant: 5),
                
                separator1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                separator1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                separator1.topAnchor.constraint(equalTo: underNameTitle1.bottomAnchor, constant: 20),
                separator1.heightAnchor.constraint(equalToConstant: 1),
                
                nameTitle2.leadingAnchor.constraint(equalTo: nameTitle1.leadingAnchor),
                nameTitle2.trailingAnchor.constraint(equalTo: nameTitle1.trailingAnchor),
                nameTitle2.topAnchor.constraint(equalTo: separator1.bottomAnchor, constant: 50),
                
                priceLabel2.trailingAnchor.constraint(equalTo: separator1.trailingAnchor),
                priceLabel2.centerYAnchor.constraint(equalTo: nameTitle2.centerYAnchor),
                
                underNameTitle2.leadingAnchor.constraint(equalTo: nameTitle2.leadingAnchor),
                underNameTitle2.topAnchor.constraint(equalTo: nameTitle2.bottomAnchor, constant: 5),
                
                separator2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                separator2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                separator2.topAnchor.constraint(equalTo: underNameTitle2.bottomAnchor, constant: 20),
                separator2.heightAnchor.constraint(equalToConstant: 1),
                
                priceButton.widthAnchor.constraint(equalToConstant: 200),
                priceButton.heightAnchor.constraint(equalToConstant: 50),
                priceButton.trailingAnchor.constraint(equalTo: separator1.trailingAnchor),
                priceButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
                
            ])
            
    }

}
