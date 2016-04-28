# Omnia

Everything your projects need to know

[![CI Status](http://img.shields.io/travis/onmyway133/Omnia.svg?style=flat)](https://travis-ci.org/onmyway133/Omnia)
[![Version](https://img.shields.io/cocoapods/v/Omnia.svg?style=flat)](http://cocoadocs.org/docsets/Omnia)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/Omnia.svg?style=flat)](http://cocoadocs.org/docsets/Omnia)
[![Platform](https://img.shields.io/cocoapods/p/Omnia.svg?style=flat)](http://cocoadocs.org/docsets/Omnia)

## Features

### Farge
Color in Swift

```swift
let _ = UIColor.Farge.hummingBird
```

### Warlock
Swizzling in Swift

```
Warlock.swizzleInstance(UIViewController.self, original: #selector(UIViewController.viewDidLoad)) {
  print("your swizzled implementation goes here")
}
```

### Throttle
Throttling in Swift

```swift
let throttle = Throttle(interval: 0.5, actionBlock: {
  print("action goes here")
})

throttle.fire()
throttle.fire()
```

### Hourglass
NSTimer in Swift

```swift
Hourglass.every(1) {
  print("code run every 1 second")
}
```

### Performer
GCD in Swift

```swift

```

## Installation

**Omnia** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Omnia'
```

**Omnia** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "onmyway133/Omnia"
```

## Author

Khoa Pham, onmyway133@gmail.com

## Contributing

We would love you to contribute to **Omnia**, check the [CONTRIBUTING](https://github.com/onmyway133/Omnia/blob/master/CONTRIBUTING.md) file for more info.

## License

**Omnia** is available under the MIT license. See the [LICENSE](https://github.com/onmyway133/Omnia/blob/master/LICENSE.md) file for more info.
