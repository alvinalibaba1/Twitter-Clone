//
//  TweetTableViewCell.swift
//  TwiterClone
//
//  Created by temp on 20/12/22.
//

import UIKit

protocol TweetTableViewDelegate: AnyObject {
    func tweetTableViewCellDidTapReply()
    func tweetTableViewCellDidTapReetweet()
    func tweetTableViewCellDidTapLike()
    func tweetTableViewCellDidTapShare()
}

class TweetTableViewCell: UITableViewCell {
    
    static let identifier = "TweetTableViewCell"
    
    weak var delegate: TweetTableViewDelegate?

    private let actionSpacing: CGFloat = 60
    private let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 25
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        image.image = UIImage(systemName: "person")
        image.backgroundColor = .red
        return image
    }()
    
    private let displayNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Alvin  Reyvaldo"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@alvinreyvaldo"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tweerTextLabel: UILabel = {
        let label = UILabel()
        label.text = "INI DIA GUYS YANG MERUPAKAN SESUATU KEAJAIBAN DUNIA ANJAAAAY MAABAAAAARR UHUUUUUYYYYYYYYY"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "reply"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "retweet"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "like"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "share"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(displayNameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(tweerTextLabel)
        contentView.addSubview(replyButton)
        contentView.addSubview(retweetButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(shareButton)
        
        configureConstraint()
        configureButton()
    }
    
    @objc func didTapReply() {
        delegate?.tweetTableViewCellDidTapReply()
    }
    
    @objc func didTapRetweet() {
        delegate?.tweetTableViewCellDidTapReetweet()
    }
    
    @objc func didTapLike() {
        delegate?.tweetTableViewCellDidTapLike()
    }
    
    @objc func didTapShare() {
        delegate?.tweetTableViewCellDidTapShare()
    }
    
    private func configureButton() {
        replyButton.addTarget(self, action: #selector(didTapReply), for: .touchUpInside)
        retweetButton.addTarget(self, action: #selector(didTapRetweet), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
        
    }
    
    
    private func configureConstraint() {
        let avatarImageConstraint = [
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50)
        ]
        
        let displayNameLabelConstraint = [
            displayNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor,constant: 20),
            displayNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20)
        
        ]
        
        let usernameLabelConstraint = [
            usernameLabel.leadingAnchor.constraint(equalTo: displayNameLabel.trailingAnchor,constant: 10),
            usernameLabel.centerYAnchor.constraint(equalTo: displayNameLabel.centerYAnchor)
        
        ]
        
        let tweetTextLabelConstraint = [
            tweerTextLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            tweerTextLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor,constant: 10),
            tweerTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -15)
        
        ]
        
        let replyButtonConstraint = [
            replyButton.leadingAnchor.constraint(equalTo: tweerTextLabel.leadingAnchor),
            replyButton.topAnchor.constraint(equalTo: tweerTextLabel.bottomAnchor,constant: 10),
            replyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -15)
        
        ]
        
        let retweetButtonConstraint = [
            retweetButton.leadingAnchor.constraint(equalTo: replyButton.trailingAnchor, constant: actionSpacing),
            retweetButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor)
        
        ]
        
        let likeButtonConstraint = [
            likeButton.leadingAnchor.constraint(equalTo: retweetButton.trailingAnchor, constant: actionSpacing),
            likeButton.centerYAnchor.constraint(equalTo: retweetButton.centerYAnchor)
            
        ]
        
        let shareButtonConstraint = [
            shareButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: actionSpacing),
            shareButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor)
            
        ]
        
        NSLayoutConstraint.activate(avatarImageConstraint)
        NSLayoutConstraint.activate(displayNameLabelConstraint)
        NSLayoutConstraint.activate(usernameLabelConstraint)
        NSLayoutConstraint.activate(tweetTextLabelConstraint)
        NSLayoutConstraint.activate(replyButtonConstraint)
        NSLayoutConstraint.activate(retweetButtonConstraint)
        NSLayoutConstraint.activate(likeButtonConstraint)
        NSLayoutConstraint.activate(shareButtonConstraint)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
