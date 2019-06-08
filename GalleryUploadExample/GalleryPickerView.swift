//
//  GalleryPickerView.swift
//  GalleryUploadExample
//
//  Created by Ahmed Kotb on 6/8/19.
//  Copyright © 2019 Ahmed Kotb. All rights reserved.
//

import UIKit
import Foundation


// MARK:- Image Picker Delegate
protocol  ImagePickerDelegate : AnyObject{   //delegate used to notify GalleryViewModel that The user has finished picking
    func didFinishPickingImage(image : UIImage)
}

// MARK:- ImagePicker Manager
class GalleryPickerView: NSObject {

    var picker = UIImagePickerController()
    var alert = UIAlertController.init(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
    var viewController : UIViewController?
    weak var delegate : ImagePickerDelegate?
    
    func showImagePicker(destinationViewController : UIViewController) {
        
        self.viewController = destinationViewController
        
    }
    
    func openCamera(){
        
        alert.dismiss(animated: true, completion: nil)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            picker.sourceType = .camera
            self.viewController!.present(picker, animated: true, completion: nil)
        } else {
            
            let warning = UIAlertController.init(title: "Warning", message: "You don't have access to the Camera", preferredStyle: .alert)
            warning.addAction(UIAlertAction.init(title: "Ok", style: .destructive, handler: nil))
            self.viewController?.present(warning, animated: true, completion: nil)
        }
    }
    
    func openGallery(){
        
        alert.dismiss(animated: true, completion: nil)
        picker.sourceType = .photoLibrary
        self.viewController!.present(picker, animated: true, completion: nil)
    }
}

extension GalleryPickerView : UIImagePickerControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Image not found, info provided: \(info)")
        }
        delegate?.didFinishPickingImage(image: image)
    }
}
