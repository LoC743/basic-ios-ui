//
//  GroupTableViewCell.swift
//  SocialAppVK
//
//  Created by Алексей Морозов on 05.10.2020.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    @IBOutlet weak var groupImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = Colors.palePurplePantone
        
        setupFriendImageView()
        setupNameLabel()
    }
    
    func setupFriendImageView() {
        groupImageView.layer.cornerRadius = groupImageView.bounds.height / 2
        groupImageView.contentMode = .scaleAspectFill
    }
    
    func setupNameLabel() {
        nameLabel.textColor = Colors.oxfordBlue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
