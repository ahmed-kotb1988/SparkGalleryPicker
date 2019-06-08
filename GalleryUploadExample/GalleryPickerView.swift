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
class GalleryPickerView: NSObject,UIImagePickerControllerDelegate {

    var picker = UIImagePickerController()
    var alert = UIAlertController.init(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
    var viewController : UIViewController?
    weak var delegate : ImagePickerDelegate?
    
    func showImagePicker(destinationViewController : UIViewController) {
        
        self.viewController = destinationViewController
        
    }
}
