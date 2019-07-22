//
//  CALayer+XYColorOC.m
//  XYColorOC
//
//  Created by RayJiang on 2019/7/18.
//  Copyright © 2019 RayJiang. All rights reserved.
//

#import "CALayer+XYColorOC.h"
#import "_XYColor_PrivateView.h"

@implementation CALayer (XYColorOC)

- (void)xy_setLayerBorderColor:(UIColor *)color with:(UIView *)view {
    if (@available(iOS 13.0, *)) {
        _XYColor_PrivateView *pv = [_XYColor_PrivateView new];
        pv.hidden = YES;
        [view addSubview:pv];
        __weak CALayer *weakLayer = self;
        [pv traitCollectionChange:^{
            weakLayer.borderColor = [color resolvedColorWithTraitCollection:view.traitCollection].CGColor;
        }];
        self.borderColor = [color resolvedColorWithTraitCollection:view.traitCollection].CGColor;
    } else {
        self.borderColor = color.CGColor;
    }
}

- (void)xy_setLayerShadowColor:(UIColor *)color with:(UIView *)view {
    if (@available(iOS 13.0, *)) {
        _XYColor_PrivateView *pv = [_XYColor_PrivateView new];
        pv.hidden = YES;
        [view addSubview:pv];
        __weak CALayer *weakLayer = self;
        [pv traitCollectionChange:^{
            weakLayer.shadowColor = [color resolvedColorWithTraitCollection:view.traitCollection].CGColor;
        }];
        self.shadowColor = [color resolvedColorWithTraitCollection:view.traitCollection].CGColor;
    } else {
        self.shadowColor = color.CGColor;
    }
}

- (void)xy_setLayerBackgroundColor:(UIColor *)color with:(UIView *)view {
    if (@available(iOS 13.0, *)) {
        _XYColor_PrivateView *pv = [_XYColor_PrivateView new];
        pv.hidden = YES;
        [view addSubview:pv];
        __weak CALayer *weakLayer = self;
        [pv traitCollectionChange:^{
            weakLayer.backgroundColor = [color resolvedColorWithTraitCollection:view.traitCollection].CGColor;
        }];
        self.backgroundColor = [color resolvedColorWithTraitCollection:view.traitCollection].CGColor;
    } else {
        self.backgroundColor = color.CGColor;
    }
}

@end
