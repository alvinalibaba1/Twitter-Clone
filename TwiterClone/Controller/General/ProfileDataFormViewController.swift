//
//  ProfileDatsFormViewController.swift
//  TwiterClone
//
//  Created by temp on 09/01/23.
//

import UIKit

class ProfileDataFormViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.keyboardDismissMode = .onDrag
        return scrollView
    }()
    
    private let displayNameTexfield: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.backgroundColor = .secondarySystemFill
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 8
        textField.attributedPlaceholder = NSAttributedString(string: "Display Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        return textField
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.backgroundColor = .secondarySystemFill
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 8
        textField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        return textField
    }()
        
    private let hintLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Fill in you data"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private let avatarPlaceHolderImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 60
        image.backgroundColor = .lightGray
        image.image = UIImage(systemName: "camera.fill")
        image.tintColor = .gray
        image.isUserInteractionEnabled = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let textBioView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .secondarySystemFill
        textView.layer.masksToBounds = true
        textView.layer.cornerRadius = 8
        textView.textContainerInset = .init(top: 15, left: 15, bottom: 15, right: 15)
        textView.text = "Tell the world about ur self"
        textView.textColor = .gray
        textView.font = .systemFont(ofSize: 16)
        return textView
    }()
    
    
    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 25
        button.isEnabled = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(hintLabel)
        scrollView.addSubview(avatarPlaceHolderImageView)
        scrollView.addSubview(displayNameTexfield)
        scrollView.addSubview(usernameTextField)
        scrollView.addSubview(textBioView)
        scrollView.addSubview(submitButton)
        isModalInPresentation = true
        displayNameTexfield.delegate = self
        usernameTextField.delegate = self
        textBioView.delegate = self
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToDismiss)))
        
        configureConstraint()
    }
    
    @objc private func didTapToDismiss() {
        view.endEditing(true)
    }
    
    
    
    
    private func configureConstraint() {
        let scrollViewConstraint = [
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        let hintLabelConstraint = [
            hintLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            hintLabel.topAnchor.constraint(equalTo: scrollView.topAnchor,constant:  30)
        
        ]
        
        let avatarPlaceHolderImageViewConstraint = [
            avatarPlaceHolderImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            avatarPlaceHolderImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarPlaceHolderImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarPlaceHolderImageView.topAnchor.constraint(equalTo: hintLabel.bottomAnchor ,constant: 30)
            
        ]
        
        let displayNameTextFieldConstraint = [
            displayNameTexfield.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            displayNameTexfield.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            displayNameTexfield.topAnchor.constraint(equalTo: avatarPlaceHolderImageView.bottomAnchor,constant: 40),
            displayNameTexfield.heightAnchor.constraint(equalToConstant: 50)
        
        ]
        
        let usernameTextFieldConstraint = [
            usernameTextField.leadingAnchor.constraint(equalTo: displayNameTexfield.leadingAnchor),
            usernameTextField.trailingAnchor.constraint(equalTo: displayNameTexfield.trailingAnchor),
            usernameTextField.topAnchor.constraint(equalTo: displayNameTexfield.bottomAnchor, constant: 20),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        
        ]
        
        let textBioViewConstraint = [
            textBioView.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            textBioView.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            textBioView.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor ,constant: 20),
            textBioView.heightAnchor.constraint(equalToConstant: 150)
        
        ]
        
        let submitButtonConstraint = [
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor ,constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 50),
            submitButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor ,constant: -20)
        
        ]
        
        NSLayoutConstraint.activate(scrollViewConstraint)
        NSLayoutConstraint.activate(hintLabelConstraint)
        NSLayoutConstraint.activate(avatarPlaceHolderImageViewConstraint)
        NSLayoutConstraint.activate(displayNameTextFieldConstraint)
        NSLayoutConstraint.activate(usernameTextFieldConstraint)
        NSLayoutConstraint.activate(textBioViewConstraint)
        NSLayoutConstraint.activate(submitButtonConstraint)
    }

}


extension ProfileDataFormViewController: UITextViewDelegate, UITextFieldDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        scrollView.setContentOffset(CGPoint(x: 0, y: textView.frame.origin.y - 100), animated: true)
         if textView.textColor == .gray {
            textView.textColor = .label
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty  {
            textView.text = "Tell the world about ur self"
            textView.textColor = .gray
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: textField.frame.origin.y - 100), animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
