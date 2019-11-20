//
//  UIView+XYColorOC.m
//  XYColorOC
//
//  Created by RayJiang on 2019/7/18.
//  Copyright © 2019 RayJiang. All rights reserved.
//

#import "UIView+XYColorOC.h"
#import "_XYColor_PrivateView.h"

@implementation UIView (XYColorOC)

- (void)xy_setLayerBorderColor:(UIColor *)color {
    if (@available(iOS 13.0, *)) {
        if (self.pv == nil) { self.pv = [_XYColor_PrivateView new]; }
        __weak UIView *weakView = self;
        [self.pv traitCollectionChange:^{
            weakView.layer.borderColor = [color resolvedColorWithTraitCollection:weakView.traitCollection].CGColor;
        }];
        self.layer.borderColor = [color resolvedColorWithTraitCollection:self.traitCollection].CGColor;
    } else {
        self.layer.borderColor = color.CGColor;
    }
}

- (void)xy_setLayerShadowColor:(UIColor *)color {
    if (@available(iOS 13.0, *)) {
        if (self.pv == nil) { self.pv = [_XYColor_PrivateView new]; }
        __weak UIView *weakView = self;
        [self.pv traitCollectionChange:^{
            weakView.layer.shadowColor = [color resolvedColorWithTraitCollection:weakView.traitCollection].CGColor;
        }];
        self.layer.shadowColor = [color resolvedColorWithTraitCollection:self.traitCollection].CGColor;
    } else {
        self.layer.shadowColor = color.CGColor;
    }
}

- (void)xy_setLayerBackgroundColor:(UIColor *)color {
    if (@available(iOS 13.0, *)) {
        if (self.pv == nil) { self.pv = [_XYColor_PrivateView new]; }
        __weak UIView *weakView = self;
        [self.pv traitCollectionChange:^{
            weakView.layer.backgroundColor = [color resolvedColorWithTraitCollection:weakView.traitCollection].CGColor;
        }];
        self.layer.backgroundColor = [color resolvedColorWithTraitCollection:self.traitCollection].CGColor;
    } else {
        self.layer.backgroundColor = color.CGColor;
    }
}

@end
