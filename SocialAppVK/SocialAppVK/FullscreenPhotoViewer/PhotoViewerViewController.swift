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

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
        setCurrentImageView()
        
        view.addSubview(currentImageView)
        
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
    
    @objc func handleLeftSwipe(sender: UISwipeGestureRecognizer) {
        currentIndex += 1
        currentImageView.image = currentImage
    }
    
    @objc func handleRightSwipe(sender: UISwipeGestureRecognizer) {
        currentIndex -= 1
        currentImageView.image = currentImage
    }

}
