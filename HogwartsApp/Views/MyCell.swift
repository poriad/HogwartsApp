//
//  MyCell.swift
//  HogwartsApp
//
//  Created by Pablo Oria de Rueda Pérez on 1/6/21.
//

import UIKit
import CollectionViewPagingLayout

class MyCell: UICollectionViewCell {
    
    var card: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        let cardFrame = CGRect(x: 80, y: 100, width: frame.width - 160, height: frame.height - 200)
        card = UIView(frame: cardFrame)
        card.backgroundColor = .orange
        contentView.addSubview(card)
    }
}

extension MyCell: ScaleTransformView {
    var scaleOptions: ScaleTransformViewOptions {
        .layout(.easeIn)
    }
}

extension MyCell: TransformableView {
    func transform(progress: CGFloat) {
        let alpha = 1 - abs(progress)
        contentView.alpha = alpha
    }
}
