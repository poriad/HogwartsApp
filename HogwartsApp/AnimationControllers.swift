//
//  AnimationControllers.swift
//  HogwartsApp
//
//  Created by Pablo Oria de Rueda Pérez on 27/5/21.
//

import UIKit

class AnimationControllers: NSObject, UIViewControllerAnimatedTransitioning {
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toViewController = transitionContext.viewController(forKey: .to)
        transitionContext.containerView.addSubview(toViewController!.view)
        toViewController?.view.alpha = 0.0
        UIView.animate(withDuration: 0.35, animations: {
            toViewController?.view.alpha = 1.0
        }, completion: { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.35
    }
}
