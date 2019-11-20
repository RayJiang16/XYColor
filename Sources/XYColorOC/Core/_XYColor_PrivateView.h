//
//  _XYColor_PrivateView.h
//  XYColorOC
//
//  Created by RayJiang on 2019/7/18.
//  Copyright © 2019 RayJiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+PrivateView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^TraitCollectionCallback)(void);

@interface _XYColor_PrivateView : UIView

- (void)traitCollectionChange:(TraitCollectionCallback)callback;

@end

NS_ASSUME_NONNULL_END
