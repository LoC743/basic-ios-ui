//
//  GroupsCollectionViewController.swift
//  SocialAppVK
//
//  Created by Алексей Морозов on 05.10.2020.
//

import UIKit

private let reuseIdentifier = "GroupCollectionViewCell"

class GroupsCollectionViewController: UICollectionViewController {
    
    var groupImages: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.palePurplePantone
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GroupCollectionViewCell
    
        cell.groupImageView.image = groupImages[indexPath.item]
    
        return cell
    }
}
