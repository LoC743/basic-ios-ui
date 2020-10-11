//
//  CustomTableViewCell.swift
//  SocialAppVK
//
//  Created by Алексей Морозов on 11.10.2020.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarView: CustomAvatarView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = Colors.palePurplePantone
    }
    
    func setValues(item: CellModel) {
        avatarView.setImage(item.image)
        nameLabel.text = item.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
