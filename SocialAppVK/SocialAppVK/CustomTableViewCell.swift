//
//  CustomTableViewCell.swift
//  SocialAppVK
//
//  Created by Алексей Морозов on 11.10.2020.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = Colors.palePurplePantone
        
        setupImageView()
    }
    
    private func setupImageView() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.contentMode = .scaleAspectFill
    }
    
    func setValues(item: CellModel) {
        avatarImageView.image = item.image
        nameLabel.text = item.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
