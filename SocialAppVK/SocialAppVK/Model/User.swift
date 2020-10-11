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
    
    static func changeUserAdded(by id: Int) {
        for i in 0..<database.count {
            if database[i].id == id {
                database[i].isAdded = !database[i].isAdded
            }
        }
    }
    
    static var database: [User] = [User(id: 0, image: UIImage(named: "profile1")!, name: "Иван Иванов", isAdded: false),
                                   User(id: 1, image: UIImage(named: "profile2")!, name: "Мария Иванова", isAdded: false),
                                   User(id: 2, image: UIImage(named: "profile3")!, name: "Николай Сидоров", isAdded: false),
                                   User(id: 3, image: UIImage(named: "profile4")!, name: "Леонид Харламов", isAdded: false),
                                   User(id: 4, image: UIImage(named: "profile5")!, name: "Ксения Новикова", isAdded: false)]
}
