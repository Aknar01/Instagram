//
//  PostItemInfo.swift
//  Instagram
//
//  Created by Aknar Assanov on 04.03.2023.
//

import UIKit

struct PostItemInfo {
    let userImage: UIImage
    let username: String
    let postSubtitle: String
    let postImage: UIImage
    let numberOfLikes: Int
    let comment: CommentShortInfo?
}

struct CommentShortInfo {
    let username: String
    let commentText: String
}
