//
//  ImageViewController.swift
//  ContainerViewDemo
//
//  Created by Siddhesh Mhatre on 24/09/17.
//  Copyright © 2017 Siddhesh Mhatre. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView : UIImageView?
    
    var image : UIImage? {
        didSet {
            self.imageView?.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView?.image = image
    }
}
