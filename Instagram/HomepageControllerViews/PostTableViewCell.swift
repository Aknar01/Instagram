//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Aknar Assanov on 04.03.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    // MARK: - Public
    func configure(with info: PostItemInfo) {
        userImageView.image = info.userImage
        usernameLabel.text = info.username
        subtitleLabel.text = info.postSubtitle
        postImageView.image = info.postImage
        likesLabel.text = "\(info.numberOfLikes) Likes"
        if let comment = info.comment {
            configureCommentLabel(with: comment)
        }
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private constants
    private enum UIConstants {
        static let userImageSize: CGFloat = 30
        static let contentInset: CGFloat = 12
        static let userImageTopInset: CGFloat = 6
        static let usernameLabelFontSize: CGFloat = 14
        static let subtitleFontSize: CGFloat = 11
        static let usernameStackToProfileImageOffset: CGFloat = 12
        static let postImageToUserImageOffset: CGFloat = 6
        static let actionsStackHeight: CGFloat = 24
        static let actionsStackToPostImageOffset: CGFloat = 12
        static let actionsStackSpacing: CGFloat = 12
        static let actionsStackToLikesLabelOffset: CGFloat = 12
        static let likesLabelFontSize: CGFloat = 14
        static let commentLabelFontSize: CGFloat = 14
        static let commentToLikesOffset: CGFloat = 12
    }
    
    // MARK: - Private properties
    private let userImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.userImageSize / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.usernameLabelFontSize, weight: .bold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.subtitleFontSize)
        return label
    }()
    
    private let optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let postImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "bubble.right"), for: .normal)
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        return button
    }()
    
    private let bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        return button
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.likesLabelFontSize, weight: .bold)
        return label
    }()

    private let commentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.commentLabelFontSize)
        return label
    }()
    
    private lazy var usernameStack: UIStackView = {
        let usernameStack = UIStackView()
        usernameStack.axis = .vertical
        usernameStack.addArrangedSubview(usernameLabel)
        usernameStack.addArrangedSubview(subtitleLabel)
        return usernameStack
    }()
   
    
    
    private lazy var actionsStack: UIStackView = {
        let actionsStack = UIStackView()
        actionsStack.axis = .horizontal
        actionsStack.addArrangedSubview(likeButton)
        actionsStack.addArrangedSubview(commentButton)
        actionsStack.addArrangedSubview(shareButton)
        actionsStack.spacing = UIConstants.actionsStackSpacing
        return actionsStack
    }()
    
    
    func configureCommentLabel(with comment: CommentShortInfo) {
        let string = comment.username + " " + comment.commentText
        let attributedString = NSMutableAttributedString(string: string)
        let range = NSRange(location: .zero, length: comment.username.count)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: UIConstants.commentLabelFontSize), range: range)
        commentLabel.attributedText = attributedString
    }
}


//MARK: - Setup views and constraints methods

private extension PostTableViewCell {
    
    func setupViews() {
        contentView.addSubview(userImageView)
        contentView.addSubview(usernameStack)
        contentView.addSubview(optionsButton)
        contentView.addSubview(postImageView)
        contentView.addSubview(actionsStack)
        contentView.addSubview(likesLabel)
        contentView.addSubview(bookmarkButton)
        contentView.addSubview(commentLabel)
    }
    
    func setupConstraints() {
        userImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalToSuperview().inset(UIConstants.userImageTopInset)
            make.size.equalTo(UIConstants.userImageSize)
        }
        usernameStack.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView)
            make.leading.equalTo(userImageView.snp.trailing).offset(UIConstants.usernameStackToProfileImageOffset)
        }
        
        optionsButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(UIConstants.contentInset)
        }
        
        postImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(userImageView.snp.bottom).offset(UIConstants.postImageToUserImageOffset)
            make.height.equalTo(contentView.snp.width)
        }
        bookmarkButton.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.actionsStackHeight)
            make.trailing.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(postImageView.snp.bottom).offset(UIConstants.actionsStackToPostImageOffset)
        }
        actionsStack.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.actionsStackHeight)
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(postImageView.snp.bottom).offset(UIConstants.actionsStackToPostImageOffset)
        }
        
        likesLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(actionsStack.snp.bottom).offset(UIConstants.actionsStackToLikesLabelOffset)
        }
        commentLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(likesLabel.snp.bottom).offset(UIConstants.commentToLikesOffset)
            make.bottom.equalToSuperview().inset(UIConstants.contentInset)
        }
    }
}
