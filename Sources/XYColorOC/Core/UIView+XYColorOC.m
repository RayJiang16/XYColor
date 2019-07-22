//
//  UIView+XYColorOC.m
//  XYColorOC
//
//  Created by RayJiang on 2019/7/18.
//  Copyright © 2019 RayJiang. All rights reserved.
//

#import "UIView+XYColorOC.h"
#import "_XYColor_PrivateView.h"
#import <objc/runtime.h>

@interface UIView ()

@property (nonatomic, strong) _XYColor_PrivateView *pv;

@end

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

#pragma mark - pv
static const char PrivateViewKey = '\0';

- (void)setPv:(_XYColor_PrivateView *)pv {
    if (pv != self.pv) {
        [self.pv removeFromSuperview];
        [self insertSubview:pv atIndex:0];
        objc_setAssociatedObject(self, &PrivateViewKey, pv, OBJC_ASSOCIATION_RETAIN);
    }
}

- (_XYColor_PrivateView *)pv {
    return objc_getAssociatedObject(self, &PrivateViewKey);
}

@end
