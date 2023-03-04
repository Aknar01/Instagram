//
//  ViewController.swift
//  Instagram
//
//  Created by Aknar Assanov on 28.02.2023.
//

import UIKit
import SnapKit

class HomePageViewController: UIViewController {
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    // MARK: - Private properties
    private let tableView = UITableView()
    private var items: [ItemType] = [
        .stories([
            StoriesItemCellInfo(image: UIImage(named: "dog")!, username: "user123", isAddButtonVisible: true, isNewStory: false),
            StoriesItemCellInfo(image: UIImage(named: "dog")!, username: "user123", isAddButtonVisible: false, isNewStory: true),
            StoriesItemCellInfo(image: UIImage(named: "dog")!, username: "user123", isAddButtonVisible: false, isNewStory: true),
            StoriesItemCellInfo(image: UIImage(named: "dog")!, username: "user123", isAddButtonVisible: false, isNewStory: true),
            StoriesItemCellInfo(image: UIImage(named: "dog")!, username: "user123", isAddButtonVisible: false, isNewStory: true),
            StoriesItemCellInfo(image: UIImage(named: "dog")!, username: "user123", isAddButtonVisible: false, isNewStory: false),
            StoriesItemCellInfo(image: UIImage(named: "dog")!, username: "user123", isAddButtonVisible: false, isNewStory: false)
        ]),
        .post(PostItemInfo(userImage: UIImage(named: "dog")!, username: "Some_dog", postSubtitle: "Sponsored", postImage: UIImage(named: "dog")!, numberOfLikes: 123, comment: CommentShortInfo(username: "Another_dog", commentText: "hahaha lol =)"))),
        .post(PostItemInfo(userImage: UIImage(named: "dog")!, username: "Some_dog", postSubtitle: "Sponsored", postImage: UIImage(named: "dog")!, numberOfLikes: 123, comment: CommentShortInfo(username: "Another_dog", commentText: "hahaha lol =)"))),
        .post(PostItemInfo(userImage: UIImage(named: "dog")!, username: "Some_dog", postSubtitle: "Sponsored", postImage: UIImage(named: "dog")!, numberOfLikes: 123, comment: CommentShortInfo(username: "Another_dog", commentText: "hahaha lol =)"))),
        .post(PostItemInfo(userImage: UIImage(named: "dog")!, username: "Some_dog", postSubtitle: "Sponsored", postImage: UIImage(named: "dog")!, numberOfLikes: 123, comment: CommentShortInfo(username: "Another_dog", commentText: "hahaha lol =)")))
    ]
}

// MARK: - Private methods
private extension HomePageViewController {
    func initialize() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.register(StoriesSetCell.self, forCellReuseIdentifier: String(describing: StoriesSetCell.self))
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
        let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makeDropDownMenu())
        return [logoBarButtonItem, dropDownButtonItem]
    }

    func makeRightBarButtonItems() -> [UIBarButtonItem] {
        let addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(didTapPlusButton))
        let directBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "message"), style: .plain, target: self, action: #selector(didTapDirectButton))
        return [directBarButtonItem, addBarButtonItem]
    }

    @objc func didTapPlusButton() {
        print("Add")
    }

    @objc func didTapDirectButton() {
        print("Direct")
    }

    func makeDropDownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Подписки", image: UIImage(systemName: "person.2")) { _ in
            print("Subs")
        }
        let favsItem = UIAction(title: "Избранное", image: UIImage(systemName: "star")) { _ in
            print("Favorites")
        }
        return UIMenu(title: "", children: [subsItem, favsItem])
    }
}

// MARK: - UITableViewDataSource
extension HomePageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .stories(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: StoriesSetCell.self), for: indexPath) as! StoriesSetCell
            cell.configure(with: info)
            return cell
        case .post(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
            cell.configure(with: post)
            return cell
        }
    }
}
