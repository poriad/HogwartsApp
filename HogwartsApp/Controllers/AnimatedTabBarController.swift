//
//  AnimatedTabBarController.swift
//  HogwartsApp
//
//  Created by Pablo Oria de Rueda Pérez on 10/7/21.
//

import UIKit

class AnimatedTabBarController: UITabBarController {
    
    var firstTabbarItemImageView: UIImageView!
    var secondTabbarItemImageView: UIImageView!
    var thirdTabbarItemImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        print(UIDevice.Type.self)
       
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
            guard let barItemView = item.value(forKey: "view") as? UIView else { return }

            let timeInterval: TimeInterval = 0.3
            let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
                barItemView.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
            }
            propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
            propertyAnimator.startAnimation()
        }

    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("pulsado")
    }
    
}

extension AnimatedTabBarController: UITabBarControllerDelegate {

    public func tabBarController(
            _ tabBarController: UITabBarController,
            animationControllerForTransitionFrom fromVC: UIViewController,
            to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController()
    }
}
