//
//  FriendsCollectionViewController.swift
//  SocialAppVK
//
//  Created by Алексей Морозов on 05.10.2020.
//

import UIKit

private let reuseIdentifier = "FriendCollectionViewCell"

class FriendsCollectionViewController: UICollectionViewController {
    
    var friendImages: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.palePurplePantone
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FriendCollectionViewCell
        
        cell.friendImageView.image = friendImages[indexPath.item]
    
        return cell
    }
}
