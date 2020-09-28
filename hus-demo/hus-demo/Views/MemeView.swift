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
    
    func viewWillAppear(_ animated: Bool) {
        self.topTextField?.adjustsFontSizeToFitWidth = true
        self.topTextField?.minimumFontSize = 11.0
        self.bottomTextFiled?.adjustsFontSizeToFitWidth = true
        self.bottomTextFiled?.minimumFontSize = 11.0
    
}
    
    
    func viewDidLoad() {
        setupTextField(topTextField!, defaultText: "TOP")
        setupTextField(bottomTextFiled!, defaultText: "BOTTOM")
        
}
    

    func setupTextFieldFont() {
        
}
    
    
        func setupTextField(_ textField: UITextField, defaultText: String) {
            textField.text = defaultText
            textField.textAlignment = .center
            textField.delegate = self 
        
    topTextField?.delegate = self
    bottomTextFiled?.delegate = self
}

    



}
