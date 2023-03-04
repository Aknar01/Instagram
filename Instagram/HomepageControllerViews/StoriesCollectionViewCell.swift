//
//  StoriesCollectionViewCell.swift
//  Instagram
//
//  Created by Aknar Assanov on 04.03.2023.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    // MARK: - Public
    func configure(with info: StoriesItemCellInfo) {
        imageView.image = info.image
        usernameLabel.text = info.username
        plusButton.isHidden = !info.isAddButtonVisible
        circleImageView.isHidden = !info.isNewStory
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private constants
    private enum UIConstants {
        static let imageSize: CGFloat = 60
        static let imageToCellInset: CGFloat = 6
        static let labelToCellInset: CGFloat = 6
        static let imageToLabelOffset: CGFloat = 6
        static let usernameFontSize: CGFloat = 12
        static let plusButtonSize: CGFloat = 20
        static let circleSize: CGFloat = 72
    }

    // MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.imageSize / 2
        view.clipsToBounds = true
        return view
    }()

    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.usernameFontSize)
        label.textAlignment = .center
        return label
    }()

    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "AddStoryButton"), for: .normal)
        return button
    }()

    private let circleImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Story ring")
        return view
    }()
}

//MARK: - Setup views and constraints methods

private extension StoriesCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(plusButton)
        contentView.addSubview(circleImageView)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.imageSize)
            make.leading.top.trailing.equalToSuperview().inset(UIConstants.imageToCellInset)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(UIConstants.labelToCellInset)
            make.top.equalTo(imageView.snp.bottom).offset(UIConstants.imageToLabelOffset)
        }
        
        plusButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(imageView)
            make.size.equalTo(UIConstants.plusButtonSize)
        }
        
        circleImageView.snp.makeConstraints { make in
            make.center.equalTo(imageView)
            make.size.equalTo(UIConstants.circleSize)
        }
    }
}
