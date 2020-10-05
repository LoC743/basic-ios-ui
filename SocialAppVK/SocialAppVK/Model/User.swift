//
//  User.swift
//  SocialAppVK
//
//  Created by Алексей Морозов on 05.10.2020.
//

import UIKit

struct User {
    let image: UIImage
    let fullName: String
}

let friendTestDataBackup: [User] = [User(image: UIImage(named: "profile1")!, fullName: "Иван Иванов"),
                              User(image: UIImage(named: "profile2")!, fullName: "Мария Иванова"),
                              User(image: UIImage(named: "profile3")!, fullName: "Николай Сидоров"),
                              User(image: UIImage(named: "profile4")!, fullName: "Леонид Харламов"),
                              User(image: UIImage(named: "profile5")!, fullName: "Ксения Новикова")]
