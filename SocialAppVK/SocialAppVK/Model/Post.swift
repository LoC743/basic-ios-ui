//
//  Post.swift
//  SocialAppVK
//
//  Created by Алексей Морозов on 11.10.2020.
//

import UIKit

enum LikeState {
    case like
    case dislike
}

protocol PostModel {
    var image: UIImage { get set }
    var likeState: LikeState { get set }
}

struct Post: PostModel {
    let id: Int
    let ownerId: Int
    
    var image: UIImage
    var likeState: LikeState
    
    mutating func changeLikeState() {
        if likeState == .dislike {
            likeState = .like
        } else {
            likeState = .dislike
        }
    }
}
