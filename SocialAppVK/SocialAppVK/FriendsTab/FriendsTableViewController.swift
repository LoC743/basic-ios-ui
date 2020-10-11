//
//  FriendsTableViewController.swift
//  SocialAppVK
//
//  Created by Алексей Морозов on 05.10.2020.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var sections: [Character] = []
    var userData: [Character: [User]] = [:]
    
    private let reuseIdentifier = "CustomTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        
        view.backgroundColor = Colors.palePurplePantone
        tableView.sectionIndexColor = .white
        
        getUserData()
    }
    
    func getUserData() {
        var sectionSet: Set<Character> = []
        for user in User.database {
            if let letter = user.name.first {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CustomTableViewCell
        
        let sectionLetter = sections[indexPath.section]
        let user = userData[sectionLetter]![indexPath.row]
        
        cell.setValues(item: user)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FriendsCollectionViewController") as! FriendsCollectionViewController
        
        let user = User.database[indexPath.row]
        
        vc.posts.append(user.image)
        vc.title = user.name
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections.map { String($0) }
    }
}
