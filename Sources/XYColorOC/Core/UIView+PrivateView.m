//
//  UIView+PrivateView.m
//  XYColor
//
//  Created by RayJiang on 2019/11/20.
//  Copyright © 2019 RayJiang. All rights reserved.
//

#import "UIView+PrivateView.h"
#import "_XYColor_PrivateView.h"
#import <objc/runtime.h>

@implementation UIView (PrivateView)

static const char PrivateViewKey = '\0';

- (void)setPv:(_XYColor_PrivateView *)pv {
    if (pv != self.pv) {
        [self.pv removeFromSuperview];
        pv.hidden = YES;
        [self insertSubview:pv atIndex:0];
        objc_setAssociatedObject(self, &PrivateViewKey, pv, OBJC_ASSOCIATION_RETAIN);
    }
}

- (_XYColor_PrivateView *)pv {
    return objc_getAssociatedObject(self, &PrivateViewKey);
}

@end
