//
//  FriendsTableViewController.swift
//  SocialAppVK
//
//  Created by Алексей Морозов on 05.10.2020.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friendTestData = friendTestDataBackup
    var sections: [Character] = []
    var userData: [Character: [User]] = [:]
    
    private var sectionSelector: SectionSelector!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.palePurplePantone
        
        getUserData()
    }
    
    func getUserData() {
        var sectionSet: Set<Character> = []
        for user in friendTestData {
            if let letter = user.fullName.first {
                sectionSet.insert(letter)
                
                if userData[letter] == nil {
                    userData[letter] = []
                }
                
                userData[letter]?.append(user)
            }
        }
        sections = sectionSet.sorted()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionLetter = sections[section]
        let users = userData[sectionLetter] ?? []
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
        return String(sections[section])
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell", for: indexPath) as! FriendTableViewCell
        
        let sectionLetter = sections[indexPath.section]
        let user = userData[sectionLetter]![indexPath.row]
        
        cell.avatarView.avatarImageView.image = user.image
        cell.nameLabel.text = user.fullName

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FriendsCollectionViewController") as! FriendsCollectionViewController
        
        let sectionLetter = sections[indexPath.section]
        let user = userData[sectionLetter]![indexPath.row]
        
        vc.friendImages.append(user.image)
        vc.title = user.fullName
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
