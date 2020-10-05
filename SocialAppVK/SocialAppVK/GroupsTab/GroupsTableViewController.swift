//
//  GroupsTableViewController.swift
//  SocialAppVK
//
//  Created by Алексей Морозов on 05.10.2020.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
    var groupsTestData: [Group] = groupsTestDataBackup

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.palePurplePantone
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsTestData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell", for: indexPath) as! GroupTableViewCell

        cell.groupImageView.image = groupsTestData[indexPath.row].image
        cell.nameLabel.text = groupsTestData[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "GroupsCollectionViewController") as! GroupsCollectionViewController
        vc.groupImages.append(groupsTestData[indexPath.row].image)
        vc.title = groupsTestData[indexPath.row].name
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groupsTestData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func addNewGroup(_ sender: UIBarButtonItem) {
        print(#function)
        let vc = AddNewGroupViewController(nibName: "AddNewGroupViewController", bundle: nil)
        vc.mainController = self
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func resetGroupList(_ sender: UIBarButtonItem) {
        groupsTestData = groupsTestDataBackup
        tableView.reloadData()
    }

}
