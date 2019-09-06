# XYColor
一个快速适配 Dark Mode 的框架

## 需求

- iOS 8.0+
- Swift 5.0+
- Xcode 11.0+

## 安装

**[CocoaPods](https://cocoapods.org/):**

- Swift
```
pod 'XYColor'
```
- Objective-C
```
pod 'XYColorOC'
```

**[Carthage](https://github.com/Carthage/Carthage):**

```
github "RayJiang16/XYColor"
```
运行 `carthage` 安装命令后会产生两个 `framework`，**Swift** 导入 `XYColor.framework`，**Objective-C** 导入 `XYColorOC.framework`。**注意：不需要同时导入两个 framework。**

## 使用

#### CALayer

由于只有 controller 和 view 可以收到模式切换的通知，所以当我们要单独给一个 layer 设置颜色的时候，需要和一个 view 绑定在一起。若 view 当前为 dark mode，则 layer 的颜色为 dark color，当 view 切换到 light mode，则 layer 的颜色变为 light color。

#### UIColor

提供了一个便捷创建方法，低于 iOS 13 则使用 light color。

更多 Dark Mode 的资料可以阅读[这篇文章](https://juejin.im/post/5cf6276be51d455a68490b26)。

**Swift**

```swift
import XYColor

// View
private var customView: UIView = {
    let view = UIView()
    ...
    view.setLayerBorderColor(UIColor.label)
    view.setLayerShadowColor(UIColor.label)
    view.setLayerBackgroundColor(UIColor.systemBackground)
    ...
    return view
}()

// Layer
private var customLayer: CALayer = {
    let layer = CALayer()
    ...
    layer.setBorderColor(UIColor.label, with: customView)
    layer.setShadowColor(UIColor.label, with: customView)
    layer.setBackgroundColor(UIColor.systemBackground, with: customView)
    ...
    return layer
}()

// Create color
private var color: UIColor = {
    return UIColor.create(light: .black, dark: .white)
}()
```

**Objective-C**
```objective-c
#import "XYColorOC/XYColorOC.h"

// View
- (UIView *)customView {
    ...
    [_customView xy_setLayerBorderColor:UIColor.labelColor];
    [_customView xy_setLayerShadowColor:UIColor.labelColor];
    [_customView xy_setLayerBackgroundColor:UIColor.systemBackgroundColor];
    ...
}

// Layer
- (CALayer *)customLayer {
    ...
    [_customLayer xy_setLayerBorderColor:UIColor.labelColor with:self.customView];
    [_customLayer xy_setLayerShadowColor:UIColor.labelColor with:self.customView];
    [_customLayer xy_setLayerBackgroundColor:UIColor.systemBackgroundColor with:self.customView];
    ...
}

// Create color
- (UIColor *)color {
    if (!_color) {
        _color = [UIColor xy_createWithLightColor:UIColor.blackColor darkColor:UIColor.whiteColor];
    }
    return _color;
}
```

## 协议

**XYColor** 基于 MIT 协议进行分发和使用，更多信息参见[协议文件](LICENSE)。