//
//  Ex+CALayer.swift
//  XYColor
//
//  Created by RayJiang on 2019/7/18.
//  Copyright © 2019 RayJiang. All rights reserved.
//

import UIKit

extension CALayer {

    public func setBorderColor(_ color: UIColor, with target: UIView) {
        if #available(iOS 13.0, *) {
            if target._pv == nil { target._pv = _PrivateView() }
            target._pv?.traitCollectionChange({ [weak self] in
                guard let self = self else { return }
                self.borderColor = color.resolvedColor(with: target.traitCollection).cgColor
            })
            borderColor = color.resolvedColor(with: target.traitCollection).cgColor
        } else {
            borderColor = color.cgColor
        }
    }
    
    public func setShadowColor(_ color: UIColor, with target: UIView) {
        if #available(iOS 13.0, *) {
            if target._pv == nil { target._pv = _PrivateView() }
            target._pv?.traitCollectionChange({ [weak self]  in
                guard let self = self else { return }
                self.shadowColor = color.resolvedColor(with: target.traitCollection).cgColor
            })
            shadowColor = color.resolvedColor(with: target.traitCollection).cgColor
        } else {
            shadowColor = color.cgColor
        }
    }

    public func setBackgroundColor(_ color: UIColor, with target: UIView) {
        if #available(iOS 13.0, *) {
            if target._pv == nil { target._pv = _PrivateView() }
            target._pv?.traitCollectionChange({ [weak self]  in
                guard let self = self else { return }
                self.backgroundColor = color.resolvedColor(with: target.traitCollection).cgColor
            })
            backgroundColor = color.resolvedColor(with: target.traitCollection).cgColor
        } else {
            backgroundColor = color.cgColor
        }
    }
    
}
