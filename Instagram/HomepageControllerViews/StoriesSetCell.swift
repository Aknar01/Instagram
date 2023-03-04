//
//  StoriesSetCell.swift
//  Instagram
//
//  Created by Aknar Assanov on 04.03.2023.
//

import SnapKit
import UIKit

class StoriesSetCell: UITableViewCell {
    // MARK: - Public
    func configure(with info: FeedStoriesCellInfo) {
        self.items = info
        collectionView.reloadData()
    }

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private constants
    private enum UIConstants {
        static let collectionViewHeight: CGFloat = 106
        static let cellWidth: CGFloat = 72
        static let cellHeight: CGFloat = 98
    }

    // MARK: - Private properties
    private var collectionView: UICollectionView!
    private var items: FeedStoriesCellInfo = []
}

// MARK: - Private methods
private extension StoriesSetCell {
    func initialize() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(StoriesCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: StoriesCollectionViewCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(UIConstants.collectionViewHeight)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension StoriesSetCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: StoriesCollectionViewCell.self), for: indexPath) as! StoriesCollectionViewCell
        cell.configure(with: items[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension StoriesSetCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.cellWidth, height: UIConstants.cellHeight)
    }
}
