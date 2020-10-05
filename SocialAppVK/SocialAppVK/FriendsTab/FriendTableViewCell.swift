//
//  FriendTableViewCell.swift
//  SocialAppVK
//
//  Created by Алексей Морозов on 05.10.2020.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = Colors.palePurplePantone
        
        setupFriendImageView()
        setupNameLabel()
    }
    
    func setupFriendImageView() {
        friendImageView.layer.cornerRadius = friendImageView.bounds.height / 2
        friendImageView.contentMode = .scaleAspectFill
    }
    
    func setupNameLabel() {
        nameLabel.textColor = Colors.oxfordBlue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
