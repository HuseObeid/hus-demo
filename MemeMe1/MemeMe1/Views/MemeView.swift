//
//  MemeView.swift
//  hus-demo
//
//  Created by Hussein Obeid on 2020-09-09.
//  Copyright © 2020 Hussein Obeid. All rights reserved.
//

import UIKit

class MemeView: UIView, UITextFieldDelegate {

    @IBOutlet var imageView: UIImageView?
    @IBOutlet var topTextField: UITextField?
    @IBOutlet var bottomTextFiled: UITextField?
    
    func update(model: MemeModel) {
        imageView?.image = model.image
        topTextField?.text = model.topText
        bottomTextFiled?.text = model.bottomText
    }
    
    func setup() {
        setupTextField(topTextField!, defaultText: "TOP")
        setupTextField(bottomTextFiled!, defaultText: "BOTTOM")
    }
    
    private func setupTextField(_ textField: UITextField, defaultText: String) {
        textField.text = defaultText
        textField.textAlignment = .center
        textField.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 40.0)
        textField.textColor = UIColor.black
        textField.delegate = self
    }
    func image() -> UIImage? {
      
        UIGraphicsBeginImageContext(self.bounds.size)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let memedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return memedImage
    }
    private let memeTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.foregroundColor: UIColor.black,
        NSAttributedString.Key.strokeWidth: -3
    ]
    
    private var strokecolor = UIColor.black
    
    // MARK: TextField Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        topTextField?.resignFirstResponder()
        bottomTextFiled?.resignFirstResponder()
        return true;
    }

    func hideKeyboard() {
        bottomTextFiled?.resignFirstResponder()
    }
}

