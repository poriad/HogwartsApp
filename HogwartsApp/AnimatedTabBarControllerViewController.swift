//
//  AnimatedTabBarControllerViewController.swift
//  HogwartsApp
//
//  Created by Pablo Oria de Rueda Pérez on 27/5/21.
//

import UIKit

class AnimatedTabBarControllerViewController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
       
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("pulsado")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.frame.size.height = 100
        tabBar.frame.origin.y = view.frame.height - 100
    }
    
}

extension AnimatedTabBarControllerViewController: UITabBarControllerDelegate {

    public func tabBarController(
            _ tabBarController: UITabBarController,
            animationControllerForTransitionFrom fromVC: UIViewController,
            to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationControllers()
    }
}
