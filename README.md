# XYColor
An easy way to adapter dark mode on CALayer

## Requirements

- iOS 8.0+
- Xcode 11.0+
- Swift 5.1+

## Installation

**Installation with [CocoaPods](https://cocoapods.org/):**
- Swift
```
pod 'XYColor'
```
- Objective-C
```
pod 'XYColorOC'
```

**Installation with [Carthage](https://github.com/Carthage/Carthage):**
```
github "RayJiang16/XYColor"
```
Run `carthage` to build the frameworks and drag the appropriate framework (`XYColor.framework` or `XYColorOC.framework`) into your Xcode project based on your need. Make sure to add only one framework and not both.


## Usage
As we all known `UIViewController` and `UIView` has `traitCollection.userInterfaceStyle` property, but `CALayer` doesn't.
Therefor `CALayer` wants to adapter dark mode, it need to bind on a `UIView`.
That means `CALayer` will change color when `UIView.traitCollection.userInterfaceStyle` changed.

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
```

## License

**XYColor** is under MIT license. See the [LICENSE](LICENSE) file for more info.
