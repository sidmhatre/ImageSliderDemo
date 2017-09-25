//
//  ImageHeaderView.swift
//  ContainerViewDemo
//
//  Created by Siddhesh Mhatre on 25/09/17.
//  Copyright © 2017 Siddhesh Mhatre. All rights reserved.
//

import UIKit

class ImageHeaderView: UIView {

    @IBOutlet weak var pageControl : UIPageControl!
    
}

extension ImageHeaderView : ImagesPageViewControllerDelegate {
    
    func setupPageController(numberOfPages : Int) {
        pageControl.numberOfPages = numberOfPages
    }
    func turnPageController(to index : Int) {
        pageControl.currentPage = index
    }
}
