//
//  ViewController.swift
//  ImagePickerApp
//
//  Created by Mohamed Kelany on 5/2/18.
//  Copyright © 2018 Mohamed Kelany. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageViewer: UIImageView!
    
    var alertController: UIAlertController?
    var pickerController: UIImagePickerController?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pickImage(_ sender: UIButton) {
       
        
        alertController = UIAlertController(title: "Take Picture", message: "Choose Image Source", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default){
            (action) in self.openCamera()
        }
        let photoAction = UIAlertAction(title: "photos", style: .default) { (action) in
            print("You picked Photo")
            self.openPhoto()
        }
        alertController?.addAction(cameraAction)
        alertController?.addAction(photoAction)
        alertController?.view.tintColor = UIColor.red
        self.present(alertController!, animated: true) {
            print("presented")
        }

    }
    
    
    
    
    func openCamera() {
        pickerController = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera) == false {
            return
        }
        pickerController?.delegate = self
        pickerController?.allowsEditing = true
        pickerController?.sourceType = .camera
        self.present(pickerController!, animated: true){
            print("presented Camera")
        }
    }
    
    func openPhoto() {
        pickerController = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) == false {
            return
        }
        pickerController?.delegate = self
        pickerController?.allowsEditing = true
        pickerController?.sourceType = .photoLibrary
        self.present(pickerController!, animated: true, completion: nil)
    }
    
    
    
    //MARK:- UINavigationControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickedImage:UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        self.imageViewer.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

