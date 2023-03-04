//
//  StoriesCellInfo.swift
//  Instagram
//
//  Created by Aknar Assanov on 04.03.2023.
//

import UIKit

struct StoriesItemCellInfo {
    let image: UIImage
    let username: String
    let isAddButtonVisible: Bool
    let isNewStory: Bool
}

typealias FeedStoriesCellInfo = [StoriesItemCellInfo]
