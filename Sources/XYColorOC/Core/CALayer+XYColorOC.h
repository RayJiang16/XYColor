//
//  CALayer+XYColorOC.h
//  XYColorOC
//
//  Created by RayJiang on 2019/7/18.
//  Copyright © 2019 RayJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (XYColorOC)

- (void)xy_setLayerBorderColor:(UIColor *)color with:(UIView *)view;
- (void)xy_setLayerShadowColor:(UIColor *)color with:(UIView *)view;
- (void)xy_setLayerBackgroundColor:(UIColor *)color with:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
