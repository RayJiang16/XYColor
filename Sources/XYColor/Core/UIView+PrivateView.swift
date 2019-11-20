//
//  UIView+PrivateView.swift
//  XYColor
//
//  Created by RayJiang on 2019/11/20.
//  Copyright © 2019 RayJiang. All rights reserved.
//

import UIKit

private var _privateViewKey: UInt8 = 0

extension UIView {
    
    var _pv: _PrivateView? {
        get {
            return objc_getAssociatedObject(self, &_privateViewKey) as? _PrivateView
        }
        set {
            if let newValue = newValue, _pv != newValue {
                _pv?.removeFromSuperview()
                newValue.isHidden = true
                insertSubview(newValue, at: 0)
                objc_setAssociatedObject(self, &_privateViewKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
            }
        }
    }
}
