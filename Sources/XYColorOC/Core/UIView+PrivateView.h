//
//  UIView+PrivateView.h
//  XYColor
//
//  Created by RayJiang on 2019/11/20.
//  Copyright © 2019 RayJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class _XYColor_PrivateView;

@interface UIView (PrivateView)

@property (nonatomic, strong) _XYColor_PrivateView *pv;

@end

NS_ASSUME_NONNULL_END
