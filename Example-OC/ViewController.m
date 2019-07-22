//
//  ViewController.m
//  Example-OC
//
//  Created by RayJiang on 2019/7/18.
//  Copyright © 2019 RayJiang. All rights reserved.
//

#import "ViewController.h"
#import "SceneDelegate.h"
#import "XYColorOC/XYColorOC.h"

@interface ViewController ()
@property (nonatomic, strong) UIColor *color1;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) CALayer *layer1;
@property (nonatomic, strong) CALayer *layer2;
@property (nonatomic, strong) CALayer *layer3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.systemBackgroundColor;
    [self.view addSubview:self.button];
    [self.view addSubview:self.label];
    [self.view.layer addSublayer:self.layer1];
    [self.view.layer addSublayer:self.layer2];
    [self.view.layer addSublayer:self.layer3];
}

- (void)buttonTapped:(UIButton *)sender {
    for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
        SceneDelegate *delegate = (SceneDelegate *)scene.delegate;
        delegate.window.overrideUserInterfaceStyle = self.view.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ? UIUserInterfaceStyleLight : UIUserInterfaceStyleDark;
    }
    
}

- (UIColor *)color1 {
    if (!_color1) {
        _color1 = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return UIColor.yellowColor;
            } else {
                return UIColor.greenColor;
            }
        }];
    }
    return _color1;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(UIScreen.mainScreen.bounds.size.width/2-100, 100, 200, 40);
        [_button setTitle:@"Change mode" forState:UIControlStateNormal];
        [_button setTitleColor:UIColor.labelColor forState:UIControlStateNormal];
        _button.layer.cornerRadius = 4;
        _button.layer.borderWidth = 1;
        [_button xy_setLayerBorderColor:UIColor.labelColor];
        [_button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
        _label.frame = CGRectMake(UIScreen.mainScreen.bounds.size.width/2-50, 160, 100, 40);
        _label.text = @"Text";
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = UIColor.labelColor;
        _label.layer.cornerRadius = 4;
        _label.layer.borderWidth = 1;
        [_label xy_setLayerBorderColor:self.color1];
    }
    return _label;
}

- (CALayer *)layer1 {
    if (!_layer1) {
        _layer1 = [CALayer new];
        _layer1.frame = CGRectMake(15, 230, 80, 80);
        _layer1.cornerRadius = 4;
        [_layer1 xy_setLayerBackgroundColor:self.color1 with:self.view];
    }
    return _layer1;
}

- (CALayer *)layer2 {
    if (!_layer2) {
        _layer2 = [CALayer new];
        _layer2.frame = CGRectMake(UIScreen.mainScreen.bounds.size.width/2-40, 230, 80, 80);
        _layer2.cornerRadius = 4;
        _layer2.borderWidth = 10;
        [_layer2 xy_setLayerBackgroundColor:self.color1 with:self.view];
        [_layer2 xy_setLayerBorderColor:UIColor.labelColor with:self.view];
    }
    return _layer2;
}

- (CALayer *)layer3 {
    if (!_layer3) {
        _layer3 = [CALayer new];
        _layer3.frame = CGRectMake(UIScreen.mainScreen.bounds.size.width-80-15, 230, 80, 80);
        _layer3.cornerRadius = 4;
        _layer3.shadowRadius = 20;
        _layer3.shadowOpacity = 1;
        [_layer3 xy_setLayerShadowColor:self.color1 with:self.view];
        [_layer3 xy_setLayerBackgroundColor:UIColor.labelColor with:self.view];
    }
    return _layer3;
}

@end
