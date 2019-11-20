//
//  _PrivateView.swift
//  XYColor
//
//  Created by RayJiang on 2019/7/18.
//  Copyright © 2019 RayJiang. All rights reserved.
//

import UIKit

class _PrivateView: UIView {

    typealias TraitCollectionCallback = () -> Void
    
    private var callbackList: [TraitCollectionCallback?] = []
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func traitCollectionChange(_ callback: TraitCollectionCallback?) {
        callbackList.append(callback)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                for callback in callbackList {
                    callback?()
                }
            }
        }
    }
}
