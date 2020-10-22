//
//  PhotoViewerViewController.swift
//  SocialAppVK
//
//  Created by Алексей Морозов on 22.10.2020.
//

import UIKit

class PhotoViewerViewController: UIViewController {
    
    var photos: [UIImage] = []
    var currentIndex: Int = 0 {
        didSet {
            if self.currentIndex < 0 {
                self.currentIndex = 0
            } else if currentIndex >= photos.count {
                self.currentIndex = photos.count - 1
            }
        }
    }
    
    var currentImage: UIImage? {
        get {
            guard photos.count > 0 else { return nil }
            
            return photos[currentIndex]
        }
    }
    
    lazy var currentImageView: UIImageView = {
        var imageView = UIImageView(frame: self.view.frame)
        imageView.image = UIImage(named: "default-profile")

        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        
        var pinch = UIPinchGestureRecognizer(target: self, action: #selector(self.handlePinchGesture))
//        imageView.addGestureRecognizer(pinch)
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleLeftSwipe))
        swipeLeft.direction = .left
        imageView.addGestureRecognizer(swipeLeft)

        var swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleRightSwipe))
        swipeRight.direction = .right
        imageView.addGestureRecognizer(swipeRight)
        
        imageView.isUserInteractionEnabled = true

        return imageView
    }()
    
    lazy var additionalImageView: UIImageView = {
        var imageView = UIImageView(frame: self.view.frame)
        imageView.image = UIImage(named: "default-profile")
        
        imageView.isHidden = true
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
        setCurrentImageView()
        
        view.addSubview(currentImageView)
        view.addSubview(additionalImageView)
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setCurrentImageView() {
        guard photos.count > 0,
              currentIndex > -1,
              photos.count > currentIndex else { return }
        
        currentImageView.image = currentImage
    }
    
    func getPhotosData(photos: [UIImage], currentIndex: Int) {
        self.photos = photos
        self.currentIndex = currentIndex
    }
    
    @objc func handlePinchGesture(sender: UIPinchGestureRecognizer) {
        currentImageView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    }
    
    private func setAdditionalImageViewRightSide() {
        self.currentIndex += 1
        additionalImageView.frame = CGRect(x: self.view.frame.maxX, y: self.view.frame.minY, width: self.view.frame.maxX, height: self.view.frame.maxY)
        self.additionalImageView.isHidden = false
        additionalImageView.image = currentImage
    }
    
    private func animateSwipe(direction: UISwipeGestureRecognizer.Direction) {
        var translationX: CGFloat = 0
        
        if direction == .left {
            translationX = -self.view.frame.maxX
        } else if direction == .right {
            translationX = self.view.frame.maxX
        }
        
        UIView.animate(withDuration: 0.4) {
            // Main ImageView
            self.currentImageView.transform = CGAffineTransform(translationX: translationX, y: 0)
            // Additional ImageView
            self.additionalImageView.transform = CGAffineTransform(translationX: translationX, y: 0)
            
        } completion: { (_) in
            // Main ImageView
            self.currentImageView.image = self.currentImage
            
            self.currentImageView.transform = .identity
            self.currentImageView.alpha = 1
            
            // Additional ImageView
            self.additionalImageView.transform = .identity
            self.additionalImageView.isHidden = true
        }
    }
    
    @objc func handleLeftSwipe(sender: UISwipeGestureRecognizer) {
        guard currentIndex + 1 != photos.count else { return }
        setAdditionalImageViewRightSide()
        animateSwipe(direction: sender.direction)
    }
    
    private func setAdditionalImageViewLeftSide() {
        self.currentIndex -= 1
        additionalImageView.frame = CGRect(x: -self.view.frame.maxX, y: self.view.frame.minY, width: self.view.frame.maxX, height: self.view.frame.maxY)
        self.additionalImageView.isHidden = false
        additionalImageView.image = currentImage
    }
    
    @objc func handleRightSwipe(sender: UISwipeGestureRecognizer) {
        guard currentIndex - 1 >= 0 else { return }
        setAdditionalImageViewLeftSide()
        animateSwipe(direction: sender.direction)
    }

}
