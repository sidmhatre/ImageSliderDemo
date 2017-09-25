//
//  ViewController.swift
//  ContainerViewDemo
//
//  Created by Siddhesh Mhatre on 24/09/17.
//  Copyright © 2017 Siddhesh Mhatre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageHeaderView: ImageHeaderView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "imagesPageViewControllerSegue" {
            if let imagesPageVC = segue.destination as? ImagesPageViewController  {
                imagesPageVC.pageViewControllerDelegate = imageHeaderView
            
            }
        }
    }
    

}

