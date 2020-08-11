//
//  MemeCreatorViewController.swift
//  hus-demo
//
//  Created by Adrian Domanico on 8/2/20.
//  Copyright © 2020 Adrian Domanico. All rights reserved.
//

import UIKit

class MemeCreatorViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet var memeImageView : UIImageView?
    
    override func viewDidLoad() {
        self.title = "Meme Demo"
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.memeImageView?.center = self.view.center
        _ = UIToolbar(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 44.0)))
        
    }
    
    func pickImageFromSource(_ source: UIImagePickerController.SourceType){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = source
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func pickAnImage(_ sender: Any) {
        pickImageFromSource(.photoLibrary)
        
    }
    
     func imagePickerController(_:UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
           
    if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
        memeImageView?.image = image
               
               
               
    } else if let  image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        memeImageView?.image = image
           
       }
    
}
}
