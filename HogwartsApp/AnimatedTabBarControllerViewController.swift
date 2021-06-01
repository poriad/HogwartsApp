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
    
}

extension AnimatedTabBarControllerViewController: UITabBarControllerDelegate {

    public func tabBarController(
            _ tabBarController: UITabBarController,
            animationControllerForTransitionFrom fromVC: UIViewController,
            to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationControllers()
    }
}
