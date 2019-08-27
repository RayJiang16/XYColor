//
//  Ex+UIColor.swift
//  XYColor
//
//  Created by RayJiang on 2019/8/27.
//  Copyright © 2019 RayJiang. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// 创建动态 UIColor 的方法
    /// - Parameter lightColor: light 模式下的颜色
    /// - Parameter darkColor: dark 模式下的颜色，低于 iOS 13.0 不生效
    public static func create(light lightColor: UIColor, dark darkColor: UIColor?) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traitCollection) -> UIColor in
                if let darkColor = darkColor, traitCollection.userInterfaceStyle == .dark {
                    return darkColor
                } else {
                    return lightColor
                }
            }
        } else {
            return lightColor
        }
    }
    
    /// 创建动态 UIColor 的方法
    /// - Parameter lightProvider: light 模式下的颜色，当模式切换到 light 时触发
    /// - Parameter darkProvider: dark 模式下的颜色，当模式切换到 dark 时触发，低于 iOS 13.0 不生效
    public static func create(light lightProvider: @escaping () -> UIColor, dark darkProvider: (() -> UIColor)?) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traitCollection) -> UIColor in
                if let darkProvider = darkProvider, traitCollection.userInterfaceStyle == .dark {
                    return darkProvider()
                } else {
                    return lightProvider()
                }
            }
        } else {
            return lightProvider()
        }
    }

}
