//
//  MemeModel.swift
//  hus-demo
//
//  Created by Hussein Obeid on 2020-09-21.
//  Copyright © 2020 Adrian Domanico. All rights reserved.
//

import UIKit

class MemeModel: NSObject {
    var image: UIImage?
    var topText: String?
    var bottomText: String?
    
    
    
    
    init(topText: String?, bottomText: String?, image: UIImage?) {
        super.init()
        self.topText = topText
        self.bottomText = bottomText
        self.image = image
        
    }
    
    

}







