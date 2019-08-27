//
//  UIColor+XYColorOC.m
//  XYColorOC
//
//  Created by RayJiang on 2019/8/27.
//  Copyright © 2019 RayJiang. All rights reserved.
//

#import "UIColor+XYColorOC.h"

@implementation UIColor (XYColorOC)

+ (UIColor *)xy_createWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return darkColor;
            } else {
                return lightColor;
            }
        }];
    } else {
        return lightColor;
    }
}

+ (UIColor *)xy_createWithLightProvider:(XYColorProvider)lightProvider darkProvider:(XYColorProvider)darkProvider {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return darkProvider();
            } else {
                return lightProvider();
            }
        }];
    } else {
        return lightProvider();
    }
}

@end
