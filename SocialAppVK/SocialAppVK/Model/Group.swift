//
//  Group.swift
//  SocialAppVK
//
//  Created by Алексей Морозов on 05.10.2020.
//

import UIKit

struct Group {
    let image: UIImage
    let name: String
}

let groupsTestDataBackup: [Group] = [Group(image: UIImage(named: "group1")!, name: "/dev/null"),
                                                         Group(image: UIImage(named: "group2")!, name: "Типичный программист"),
                                                         Group(image: UIImage(named: "group3")!, name: "Habr"),
                                                         Group(image: UIImage(named: "group4")!, name: "Nintendo Россия")]
