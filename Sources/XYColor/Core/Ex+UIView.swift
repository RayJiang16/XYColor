//
//  Ex+UIView.swift
//  XYColor
//
//  Created by RayJiang on 2019/7/18.
//  Copyright © 2019 RayJiang. All rights reserved.
//

import UIKit

extension UIView {

    public func setLayerBorderColor(_ color: UIColor) {
        if #available(iOS 13.0, *) {
            if _pv == nil { _pv = _PrivateView() }
            _pv?.traitCollectionChange({ [weak self] in
                guard let self = self else { return }
                self.layer.borderColor = color.resolvedColor(with: self.traitCollection).cgColor
            })
            layer.borderColor = color.resolvedColor(with: traitCollection).cgColor
        } else {
            layer.borderColor = color.cgColor
        }
    }

    public func setLayerShadowColor(_ color: UIColor) {
        if #available(iOS 13.0, *) {
            if _pv == nil { _pv = _PrivateView() }
            _pv?.traitCollectionChange({ [weak self]  in
                guard let self = self else { return }
                self.layer.shadowColor = color.resolvedColor(with: self.traitCollection).cgColor
            })
            layer.shadowColor = color.resolvedColor(with: traitCollection).cgColor
        } else {
            layer.shadowColor = color.cgColor
        }
    }

    public func setLayerBackgroundColor(_ color: UIColor) {
        if #available(iOS 13.0, *) {
            if _pv == nil { _pv = _PrivateView() }
            _pv?.traitCollectionChange({ [weak self]  in
                guard let self = self else { return }
                self.layer.backgroundColor = color.resolvedColor(with: self.traitCollection).cgColor
            })
            layer.backgroundColor = color.resolvedColor(with: traitCollection).cgColor
        } else {
            layer.backgroundColor = color.cgColor
        }
    }

}
