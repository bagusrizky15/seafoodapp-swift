//
//  ViewController.swift
//  SeaFood
//
//  Created by BBPDEV on 22/08/23.
//

import UIKit
//help process image easily and allow using image work with CoreML
import Vision
import CoreML

class ViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = userPickImage
        }
        
        print(imageView.image)
        
        imagePicker.dismiss(animated: true)
        
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlert()
        
        present(imagePicker, animated: true)
    }
    
}

