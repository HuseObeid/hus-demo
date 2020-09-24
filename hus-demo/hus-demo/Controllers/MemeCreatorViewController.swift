//
//  MemeCreatorViewController.swift
//  hus-demo
//
//  Created by Adrian Domanico on 8/2/20.
//  Copyright © 2020 Adrian Domanico. All rights reserved.
//

import UIKit

class MemeCreatorViewController: UIViewController, (UIImagePickerControllerDelegate & UINavigationControllerDelegate) {

    @IBOutlet var memeView : UIView?
    @IBOutlet weak var toolBar: UIToolbar?
    
    private var pickerController: UIImagePickerController?
    
    override func viewDidLoad() {
        self.title = "Meme Demo"
        super.viewDidLoad()
        pickerController = UIImagePickerController()
        pickerController?.delegate = self
        pickerController?.sourceType = .photoLibrary
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.memeView?.center = self.view.center
        
    }

    // MARK: UI Actions
    
    @IBAction func pickAnImage(_ sender: Any) {
        presentImagePicker()
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        presentImagePicker()
        
    }
    
    // MARK: Image Picker Deleagte
    
    
    private func ImagePickerController(_:UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
    }

    // MARK: Helpers
    
    private func presentImagePicker() {
        guard let viewController = pickerController else { return }
        present(viewController, animated: true, completion: nil)
    }

}
