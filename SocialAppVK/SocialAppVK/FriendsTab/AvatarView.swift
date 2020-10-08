//
//  AvatarView.swift
//  SocialAppVK
//
//  Created by Алексей Морозов on 08.10.2020.
//

import UIKit

@IBDesignable class AvatarView: UIView {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.6 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 8 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    private var shadowLayer: CAShapeLayer!
    private var cornerRadius: CGFloat = 25.0
     
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cornerRadius = self.frame.height / 2
        self.backgroundColor = Colors.palePurplePantone

        if shadowLayer == nil {
            
            shadowLayer = CAShapeLayer()
          
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath

            shadowLayer.shadowColor = shadowColor.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize.zero
            shadowLayer.shadowOpacity = shadowOpacity
            shadowLayer.shadowRadius = shadowRadius

            layer.insertSublayer(shadowLayer, at: 0)
        }
        
        avatarImageView.layer.cornerRadius = cornerRadius
    }
}
