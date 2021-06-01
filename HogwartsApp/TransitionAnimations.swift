//
//  TransitionAnimations.swift
//  HogwartsApp
//
//  Created by Pablo Oria de Rueda Pérez on 27/5/21.
//

import UIKit

class TransitionAnimations: NSObject, UIViewControllerAnimatedTransitioning {
    
    enum TransitionAnimationsTMode: Int {
        case Present, Pop
    }
    
    var transitionMode: TransitionAnimationsTMode = .Present
    var scaleFactor: CGFloat = 0.05
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let containerView = transitionContext.containerView else {
            transitionContext.completeTransition(true)
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
}
