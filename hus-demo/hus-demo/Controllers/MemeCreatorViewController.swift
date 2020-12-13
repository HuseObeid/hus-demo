//
//  MemeCreatorViewController.swift
//  hus-demo
//
//  Created by Adrian Domanico on 8/2/20.
//  Copyright © 2020 Adrian Domanico. All rights reserved.
//

import UIKit

class MemeCreatorViewController: UIViewController, (UIImagePickerControllerDelegate & UINavigationControllerDelegate) {
    
    @IBOutlet var memeView : MemeView!
    @IBOutlet weak var toolBar: UIToolbar?
    
    @IBOutlet var cameraButton: UIView!
    
    private var pickerController: UIImagePickerController?
    
    override func viewDidLoad() {
        self.title = "Meme Demo"
        super.viewDidLoad()
        pickerController = UIImagePickerController()
        pickerController?.delegate = self
        pickerController?.sourceType = .photoLibrary
        self.memeView!.setup()
        
        
        NotificationCenter.default.addObserver(self,selector: #selector(self.keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self,selector: #selector(self.keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.memeView!.center = self.view.center
       
    }
    
    // MARK: UI Actions
    
    @IBAction func pickAnImage(_ sender: Any) {
        presentImagePicker()
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        presentImagePicker()
        pickerController?.sourceType = .camera
    }
    
 
    
    // MARK: Image Picker Deleagte
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Image Picked")
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
        memeView!.update(model: MemeModel(topText: "", bottomText: "", image: image))
        pickerController?.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Image Picker Cancelled")
        picker.dismiss(animated: true, completion: nil)
    }
    
    // MARK: Helpers
    
    private func presentImagePicker() {
        guard let viewController = pickerController else { return }
        present(viewController, animated: true, completion: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        guard let keyboardFrame = keyboardValue?.cgRectValue else { return }
        
        _ = self.memeView.frame.origin.y == 0; do {
            self.view.frame.origin.y = 100 - keyboardFrame.height
            
        }
    }
    
    
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.memeView!.center = self.view.center
        let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        guard let keyboardFrame = keyboardValue?.cgRectValue else { return }
        _ = self.memeView.frame.origin.y == 0; do {
            self.view.frame.origin.y -= keyboardFrame.height
            
        }
        
    }
    
    
    func generateMemedImage() -> UIImage {
        
        self.toolBar?.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
        
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        self.toolBar?.isHidden = false
        self.navigationController?.navigationBar.isHidden = false 
        
        
        return memedImage
        
        
    }
    
 
        
    
    @IBAction func shareMeme(_ sender: Any) {
        /* let activityController = UIActivityViewController(activityItems: [memeView.imageView!], applicationActivities: nil)
         present(activityController, animated: true, completion: nil)*/
        
        let memedImage: UIImage = generateMemedImage()
        let shareSheet = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        shareSheet.completionWithItemsHandler = { (_, completed, _, _) in
            if (completed) {
                /*self.save()*/
               
                
            }
        }
        present(shareSheet, animated: true, completion: nil)
    }
    
    
    
}




