//
//  OnboardingViewController.swift
//  TwiterClone
//
//  Created by temp on 03/01/23.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.tintColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        return button
    }()
    
    private let prompLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .gray
        label.text = "Have an account already?"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create Account", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24 , weight: .bold)
        button.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        button.layer.masksToBounds = true
        button.tintColor = .white
        button.layer.cornerRadius = 30
        return button
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.textAlignment = .center
        label.textColor = .label
        label.text =  "See whats Happening in the world right now"
        label.numberOfLines = 0
        return label
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(welcomeLabel)
        view.addSubview(createAccountButton)
        view.addSubview(prompLabel)
        view.addSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
        
        configureConstraint()
        
    }
    
    @objc private func didTapLogin() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapCreateAccount() {
        let vc = RegisterViewController()
        navigationController?.pushViewController( vc, animated: true)
    }
    
    private func configureConstraint()  {
        let welcomeLabelConstraint = [
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        ]
        
        let createAccountButtonConstraint = [
            createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccountButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            createAccountButton.widthAnchor.constraint(equalTo: welcomeLabel.widthAnchor,constant: -20),
            createAccountButton.heightAnchor.constraint(equalToConstant: 60)
        
        ]
        
        let promtLabelConstraint = [
            prompLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            prompLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -60)
            
        ]
        
        let loginButtonConstraint = [
            loginButton.centerYAnchor.constraint(equalTo: prompLabel.centerYAnchor),
            loginButton.leadingAnchor.constraint(equalTo: prompLabel.trailingAnchor, constant: 10)
        
        
        ]
        
        NSLayoutConstraint.activate(welcomeLabelConstraint)
        NSLayoutConstraint.activate(createAccountButtonConstraint)
        NSLayoutConstraint.activate(promtLabelConstraint)
        NSLayoutConstraint.activate(loginButtonConstraint)
    }

}
