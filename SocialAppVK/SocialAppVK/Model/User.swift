//
//  User.swift
//  SocialAppVK
//
//  Created by Алексей Морозов on 05.10.2020.
//

import UIKit

protocol CellModel {
    var image: UIImage { get set }
    var name: String { get set }
    var isAdded: Bool  { get set }
}

struct User: CellModel {
    let id: Int
    
    var image: UIImage
    var name: String
    var isAdded: Bool
    
    var posts: [Post]
    
    static func changeUserAdded(by id: Int) {
        for i in 0..<database.count {
            if database[i].id == id {
                database[i].isAdded = !database[i].isAdded
            }
        }
    }
    
    static var database: [User] = [User(id: 0, image: UIImage(named: "profile1")!, name: "Иван Иванов", isAdded: false, posts: [Post(id: 0, ownerId: 0, image: UIImage(named: "profile1")!, likeState: .dislike), Post(id: 1, ownerId: 0, image: UIImage(named: "profile2")!, likeState: .like)]),
                                   User(id: 1, image: UIImage(named: "profile2")!, name: "Мария Иванова", isAdded: false, posts: [Post(id: 0, ownerId: 1, image: UIImage(named: "profile2")!, likeState: .dislike)]),
                                   User(id: 2, image: UIImage(named: "profile3")!, name: "Николай Сидоров", isAdded: false, posts: [Post(id: 0, ownerId: 2, image: UIImage(named: "profile3")!, likeState: .dislike)]),
                                   User(id: 3, image: UIImage(named: "profile4")!, name: "Леонид Харламов", isAdded: false, posts: [Post(id: 0, ownerId: 3, image: UIImage(named: "profile4")!, likeState: .dislike)]),
                                   User(id: 4, image: UIImage(named: "profile5")!, name: "Ксения Новикова", isAdded: false, posts: [Post(id: 0, ownerId: 4, image: UIImage(named: "profile5")!, likeState: .dislike)])]
}
