//
//  AddNewGroupViewController.swift
//  SocialAppVK
//
//  Created by Алексей Морозов on 05.10.2020.
//

import UIKit

class AddNewGroupViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var newGroupImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    var mainController: GroupsTableViewController?
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView()
    }
    
    func setupImageView() {
        newGroupImageView.layer.cornerRadius = newGroupImageView.bounds.size.height / 2
        newGroupImageView.contentMode = .scaleAspectFill
    }
    

    @IBAction func add(_ sender: UIButton) {
        let image = newGroupImageView.image ?? UIImage()
        let name = nameTextField.text ?? ""
        
        let newGroup = Group(image: image, name: name)
        
        mainController?.groupsTestData.append(newGroup)
        mainController?.tableView.reloadData()
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loadImage(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = true

            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newGroupImageView.image = pickedImage
            }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
}
