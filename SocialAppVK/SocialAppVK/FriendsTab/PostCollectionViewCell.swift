//
//  PostCollectionViewCell.swift
//  SocialAppVK
//
//  Created by Алексей Морозов on 11.10.2020.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = .cyan
        
        setupImageView()
    }
    
    func setupImageView() {
        imageView.contentMode = .scaleAspectFill
    }
    
    func setValues(image: UIImage) {
        imageView.image = image
    }

}
