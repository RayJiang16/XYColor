//
//  _XYColor_PrivateView.m
//  XYColorOC
//
//  Created by RayJiang on 2019/7/18.
//  Copyright © 2019 RayJiang. All rights reserved.
//

#import "_XYColor_PrivateView.h"

@interface _XYColor_PrivateView ()

@property (nonatomic, copy) NSMutableArray<TraitCollectionCallback> *callbackList;

@end

@implementation _XYColor_PrivateView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
    }
    return self;
}

- (void)traitCollectionChange:(TraitCollectionCallback)callback {
    [self.callbackList addObject:callback];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        if([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            for (TraitCollectionCallback callback in self.callbackList) {
                callback();
            }
        }
    }
}

- (NSMutableArray<TraitCollectionCallback> *)callbackList {
    if (!_callbackList) {
        _callbackList = @[].mutableCopy;
    }
    return _callbackList;
}

@end
