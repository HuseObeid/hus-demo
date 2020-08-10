//
//  MemeCreatorViewController.swift
//  hus-demo
//
//  Created by Adrian Domanico on 8/2/20.
//  Copyright © 2020 Adrian Domanico. All rights reserved.
//

import UIKit

class MemeCreatorViewController: UIViewController {

    @IBOutlet var memeImageView : UIImageView?
    
    override func viewDidLoad() {
        self.title = "Meme Demo"
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.memeImageView?.center = self.view.center
    }
    
    
    @IBAction func pickAnImage(_ sender: Any) {
    }
    
}
