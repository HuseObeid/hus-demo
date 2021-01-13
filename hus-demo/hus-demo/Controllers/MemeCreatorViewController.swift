//
//  MemeCreatorViewController.swift
//  hus-dem0
//
//  Created by Adrian Domanico on 8/2/20.
//  Copyright © 2020 Adrian Domanico. All rights reserved.
//

import UIKit

class MemeCreatorViewController: UIViewController, (UIImagePickerControllerDelegate & UINavigationControllerDelegate) {
    
    
    
    @IBOutlet var memeView : MemeView!
    @IBOutlet weak var toolBar: UIToolbar?
    @IBOutlet var cameraButton: UIView!
    
    @IBOutlet var keyboardConstraint : NSLayoutConstraint!
    
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
    
    // MARK: UI Actions
    
    func pickImageFromSource(_ source: UIImagePickerController.SourceType){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = source
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func pickAnImage(_ sender: Any) {
        /*presentImagePicker()*/
        pickImageFromSource(.photoLibrary)
        
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        /*presentImagePicker()
         pickerController?.sourceType = .camera*/
        pickImageFromSource(.camera)
        
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
    
    // MARK: Sharing
    
    struct Meme {}
    
    func save() {
        _ = Meme.self
    }
    
    @IBAction func shareMeme(_ sender: Any) {
        let memedImage: UIImage = self.memeView.image()!
        let shareSheet = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil); shareSheet.completionWithItemsHandler = {  (_, completed, _, _) in
            print("Completed!")
            if (completed) {
                self.save()
            }
        }
        present(shareSheet, animated: true, completion: nil)
        
    }
    func generatedMemedImage() -> UIImage {
        toolBar!.isHidden = true
        UIGraphicsBeginImageContext(self.view.frame.size)
        
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        return memedImage
        
    }
    // MARK: Helpers
    
    private func presentImagePicker() {
        guard let viewController = pickerController else { return }
        present(viewController, animated: true, completion: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        guard let keyboardFrame = keyboardValue?.cgRectValue else { return }
        self.keyboardConstraint.priority = UILayoutPriority(rawValue: 900.0);
        self.keyboardConstraint.constant = keyboardFrame.size.height
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.memeView!.center = self.view.center
        let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        guard let _ = keyboardValue?.cgRectValue else { return }
        self.keyboardConstraint.priority = UILayoutPriority(rawValue: 500.0)
    }
    
    
}

