//
//  ImagesPageViewController.swift
//  ContainerViewDemo
//
//  Created by Siddhesh Mhatre on 24/09/17.
//  Copyright © 2017 Siddhesh Mhatre. All rights reserved.
//

import UIKit

protocol ImagesPageViewControllerDelegate : class {
    func setupPageController(numberOfPages : Int)
    func turnPageController(to index : Int)
}

class ImagesPageViewController: UIPageViewController {

    
    var images : [UIImage]? = [#imageLiteral(resourceName: "I1"), #imageLiteral(resourceName: "I2"), #imageLiteral(resourceName: "I3"), #imageLiteral(resourceName: "I4"), #imageLiteral(resourceName: "I5")]
    
    weak var pageViewControllerDelegate : ImagesPageViewControllerDelegate? 
    
    struct Storyboard {
        static let imageViewController = "imageViewController"
    }
    
    lazy var controllers : [UIViewController] = {
        let storyborad = UIStoryboard(name: "Main", bundle: nil)
        
        var controllers = [UIViewController]()
        
        if let images = self.images {
            for image in images {
                let imageVC = storyborad.instantiateViewController(withIdentifier: Storyboard.imageViewController)
                controllers.append(imageVC)
            }
        }
        
        self.pageViewControllerDelegate?.setupPageController(numberOfPages: controllers.count)
        
        return controllers
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyAdjustsScrollViewInsets = false
        dataSource = self
        delegate = self
        
        self.turnToPage(index : 0)
    }
    
    func turnToPage(index : Int) {
     
        let controller = controllers[index]
        var direction = UIPageViewControllerNavigationDirection.forward
        
        if let currentVC = viewControllers?.first{
        
            let currentIndex = controllers.index(of: currentVC)
            
            if currentIndex! > index {
                direction = .reverse
            }
        }
        
        self.configureDisplaying(viewController : controller)
        
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
        
    }

    func configureDisplaying(viewController : UIViewController){
        for (index, vc) in controllers.enumerated(){
            if viewController == vc {
                if let imageVC = viewController as? ImageViewController {
                    imageVC.image = self.images?[index]
                    
                    self.pageViewControllerDelegate?.turnPageController(to: index)
                }
            }
        }
        
    }
}

extension ImagesPageViewController : UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let index = controllers.index(of: viewController) {
            if index > 0 {
             return controllers[index - 1]
            }
        }
        return controllers.last
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let index = controllers.index(of: viewController) {
            if index < controllers.count - 1  {
                return controllers[index + 1]
            }
        }
        return controllers.first
    }
}


extension ImagesPageViewController : UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.configureDisplaying(viewController: pendingViewControllers.first as! ImageViewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            self.configureDisplaying(viewController: previousViewControllers.first as! ImageViewController)
        }
    }
    
}
