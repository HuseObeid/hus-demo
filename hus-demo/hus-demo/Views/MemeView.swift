//
//  MemeView.swift
//  hus-demo
//
//  Created by Hussein Obeid on 2020-09-09.
//  Copyright © 2020 Adrian Domanico. All rights reserved.
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
        textField.textColor = UIColor.white
        textField.delegate = self
    }
    
    // MARK: TextField Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true;
    }
}
