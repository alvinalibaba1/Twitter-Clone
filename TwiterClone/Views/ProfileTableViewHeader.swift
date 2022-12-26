//
//  ProfileHeader.swift
//  TwiterClone
//
//  Created by temp on 22/12/22.
//

import UIKit

class ProfileTableViewHeader: UIView {
    
    private enum SectionTabs: String {
        case tweets = "Tweets"
        case tweetsAndReplies = "Tweets & Replies"
        case media = "Media"
        case likes = "Likes"
        
        var index: Int {
            switch self {
            case .tweets:
                return 0
            case .tweetsAndReplies:
                return 1
            case .media:
                return 2
            case .likes:
                return 3
            }
        }
    }
    
    private var leadingAnchors: [NSLayoutConstraint] = []
    private var trailingAnchors: [NSLayoutConstraint] = []
    
    private let indicator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        return view
    }()
    
    private var selectedTabs: Int = 0 {
        didSet {
            for i in 0..<tabs.count {
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) { [weak self] in
                    self?.sectionStack.arrangedSubviews[i].tintColor = i == self?.selectedTabs ? .label: .secondaryLabel
                    self?.leadingAnchors[i].isActive = i == self?.selectedTabs ? true : false
                    self?.trailingAnchors[i].isActive = i == self?.selectedTabs ? true : false
                    self?.layoutIfNeeded()
                } completion: { _ in
                    
                }
            }
        }
    }
    
    private var tabs: [UIButton] = ["Tweets", "Tweets & Replies", "Media", "Likes"]
        .map { buttonTitle in
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            button.tintColor = .label
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }
    
    private lazy var sectionStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: tabs)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    private let followersTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Followers"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let followersCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1M"
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let followingTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Following"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let followingCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "314"
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let joinedDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Joined Februari 2021"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let joinedDateImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "calendar", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14))
        image.tintColor = .secondaryLabel
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let userBioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "iOS Developer"
        label.numberOfLines =  3
        label.textColor = .label
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "@AlvinReyvaldo"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private let displayNameLabe: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Alvin Reyvaldo"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let  profileHeaderImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person")
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 40
        image.backgroundColor = .cyan
        return image
    }()
    
    private let headerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "image")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerImage)
        addSubview(profileHeaderImage)
        addSubview(displayNameLabe)
        addSubview(usernameLabel)
        addSubview(userBioLabel)
        addSubview(joinedDateImageView)
        addSubview(joinedDateLabel)
        addSubview(followingCountLabel)
        addSubview(followingTextLabel)
        addSubview(followersCountLabel)
        addSubview(followersTextLabel)
        addSubview(sectionStack)
        addSubview(indicator)
        configureConstraint()
        confiureStackButton()
    }
    
    private func confiureStackButton() {
        for (i, button) in sectionStack.arrangedSubviews.enumerated() {
            guard let button = button as? UIButton else { return }
            
            if i == selectedTabs {
                button.tintColor = .label
            } else {
                button.tintColor =  .secondaryLabel
            }
            
            button.addTarget(self, action: #selector(didTapTab(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func didTapTab(_ sender: UIButton) {
        guard let label = sender.titleLabel?.text else {return}
        switch label {
        case SectionTabs.tweets.rawValue:
            selectedTabs = 0
        case SectionTabs.tweetsAndReplies.rawValue:
            selectedTabs = 1
        case SectionTabs.media.rawValue:
            selectedTabs = 2
        case SectionTabs.likes.rawValue:
            selectedTabs = 3
        default:
            selectedTabs = 0
        }
    }

    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureConstraint() {
        
        for i in 0..<tabs.count {
            let leadingAnchor = indicator.leadingAnchor.constraint(equalTo: sectionStack.arrangedSubviews[i].leadingAnchor)
            leadingAnchors.append(leadingAnchor)
            let trailingAnchor = indicator.trailingAnchor.constraint(equalTo: sectionStack.arrangedSubviews[i].trailingAnchor)
            trailingAnchors.append(trailingAnchor)
        }
        
        
        let headerImageConstraint = [
            headerImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerImage.topAnchor.constraint(equalTo: topAnchor),
            headerImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerImage.heightAnchor.constraint(equalToConstant: 150)
        ]
        
        let profileHeaderImageConstraint = [
            profileHeaderImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            profileHeaderImage.centerYAnchor.constraint(equalTo: headerImage.bottomAnchor,constant: 10),
            profileHeaderImage.widthAnchor.constraint(equalToConstant: 80),
            profileHeaderImage.heightAnchor.constraint(equalToConstant: 80),
        ]
        
        let displayNamelabelConstraint = [
            displayNameLabe.leadingAnchor.constraint(equalTo: profileHeaderImage.leadingAnchor),
            displayNameLabe.topAnchor.constraint(equalTo: profileHeaderImage.bottomAnchor,constant: 20)
        
        ]
        
        let usernameLabelConstraint = [
            usernameLabel.leadingAnchor.constraint(equalTo: displayNameLabe.leadingAnchor),
            usernameLabel.topAnchor.constraint(equalTo: displayNameLabe.bottomAnchor,constant: 5)
        
        ]
        
        let userBioLabelConstraint = [
            userBioLabel.leadingAnchor.constraint(equalTo: displayNameLabe.leadingAnchor),
            userBioLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -5),
            userBioLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5)
        ]
        
        let joinedDateImageViewConstraint = [
            joinedDateImageView.leadingAnchor.constraint(equalTo: displayNameLabe.leadingAnchor),
            joinedDateImageView.topAnchor.constraint(equalTo: userBioLabel.bottomAnchor,constant: 5)
        
        ]
        
        let joinedDateLabelConstraint = [
            joinedDateLabel.leadingAnchor.constraint(equalTo: joinedDateImageView.trailingAnchor,constant: 2),
            joinedDateLabel.bottomAnchor.constraint(equalTo: joinedDateImageView.bottomAnchor)
        ]
        
        let followingCountLabelConstraint = [
            followingCountLabel.leadingAnchor.constraint(equalTo: displayNameLabe.leadingAnchor),
            followingCountLabel.topAnchor.constraint(equalTo: joinedDateLabel.bottomAnchor,constant: 10)
        
        ]
        
        let followingTextLabelConstraint = [
            followingTextLabel.leadingAnchor.constraint(equalTo: followingCountLabel.trailingAnchor,constant: 4),
            followingTextLabel.bottomAnchor.constraint(equalTo: followersCountLabel.bottomAnchor)
        
        ]
        
        let followersCountLabelConstraint = [
            followersCountLabel.leadingAnchor.constraint(equalTo: followingTextLabel.trailingAnchor,constant: 8),
            followersCountLabel.bottomAnchor.constraint(equalTo: followingCountLabel.bottomAnchor)
        
        ]
        
        
        let followersTextLabelConstraint = [
            followersTextLabel.leadingAnchor.constraint(equalTo: followersCountLabel.trailingAnchor,constant: 4),
            followersTextLabel.bottomAnchor.constraint(equalTo: followingCountLabel.bottomAnchor)
        
        ]
        
        let sectionStackConstraint = [
            sectionStack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            sectionStack.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25),
            sectionStack.topAnchor.constraint(equalTo: followingCountLabel.bottomAnchor,constant: 5),
            sectionStack.heightAnchor.constraint(equalToConstant: 35)
        
        ]
        
        
        let indicatorConstraint = [
            leadingAnchors[0],
            trailingAnchors[0],
            indicator.topAnchor.constraint(equalTo: sectionStack.arrangedSubviews[0].bottomAnchor),
            indicator.heightAnchor.constraint(equalToConstant: 4)
        
        
        ]
        
        
        NSLayoutConstraint.activate(headerImageConstraint)
        NSLayoutConstraint.activate(profileHeaderImageConstraint)
        NSLayoutConstraint.activate(displayNamelabelConstraint)
        NSLayoutConstraint.activate(usernameLabelConstraint)
        NSLayoutConstraint.activate(userBioLabelConstraint)
        NSLayoutConstraint.activate(joinedDateImageViewConstraint)
        NSLayoutConstraint.activate(joinedDateLabelConstraint)
        NSLayoutConstraint.activate(followingTextLabelConstraint)
        NSLayoutConstraint.activate(followingCountLabelConstraint)
        NSLayoutConstraint.activate(followersCountLabelConstraint)
        NSLayoutConstraint.activate(followersTextLabelConstraint)
        NSLayoutConstraint.activate(sectionStackConstraint)
        NSLayoutConstraint.activate(indicatorConstraint)

    }
}
