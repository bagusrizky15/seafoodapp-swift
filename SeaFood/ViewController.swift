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
        imagePicker.allowsEditing = false
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = userPickImage
            
            guard CIImage(image: userPickImage) != nil else {
                fatalError("could not convert ui image to ci image")
            }
            
        }
        
        imagePicker.dismiss(animated: true)
        
    }
    
    func detect(image: UIImage){
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {fatalError("loading core ML error")}
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Mau ngambil gambar darimana?", message: "", preferredStyle: .alert)
        let camera = UIAlertAction(title: "Kamera", style: .default){
            camera in
            
            self.putImage(1)
        }
        let album = UIAlertAction(title: "Gallery", style: .default){
            album in
            
            self.putImage(0)

        }
        
        alert.addAction(camera)
        alert.addAction(album)
        present(alert, animated: true)
        
    }
    
    func putImage(_ code : Int){
        if code == 1{
            self.imagePicker.sourceType = .camera
        } else {
            self.imagePicker.sourceType = .photoLibrary
        }
        present(self.imagePicker, animated: true)
    }
    
}

